import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:eb_demo_app/core/utils/helpers/internet_connection_helpers.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

part 'internet_event.dart';
part 'internet_state.dart';

@lazySingleton
class InternetBloc extends Bloc<InternetEvent, InternetState> {
  final InternetConnectionHelpers _internetConnectionHelpers;
  late final StreamSubscription<InternetStatus> _connectionSubscription;

  InternetBloc(this._internetConnectionHelpers) : super(Initial()) {
    _connectionSubscription =
        _internetConnectionHelpers.checkInternetStatus().listen(
      (status) {
        log('Internet status: $status');
        switch (status) {
          case InternetStatus.connected:
            add(InternetConnectedEvent());
            break;
          case InternetStatus.disconnected:
            add(InternetDisConnectedEvent());
            break;
        }
      },
    );

    on<InternetConnectedEvent>((event, emit) {
      emit(Online());
    });

    on<InternetDisConnectedEvent>((event, emit) {
      emit(Offline());
    });
  }

  @override
  Future<void> close() {
    _connectionSubscription.cancel();
    return super.close();
  }

  @override
  void onTransition(Transition<InternetEvent, InternetState> transition) {
    super.onTransition(transition);
    print('Internet state transition: $transition');
  }
}
