import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:eb_demo_app/core/config/injection/injection.dart';
import 'package:eb_demo_app/core/utils/socket/socket_client_manager.dart';
import 'package:eb_demo_app/src/features/chat/data/repository/chat_respository.dart';
import 'package:injectable/injectable.dart';

import '../../../../authentication/data/data_source/local/auth_database_service.dart';
import '../../../data/model/chat.dart';
import '../../../data/model/user.dart';

part 'socket_event.dart';
part 'socket_state.dart';

@injectable
class SocketBloc extends Bloc<SocketEvent, SocketState> {
  final SocketClientManager _socketClientManager;
  final ChatRespository _chatRespository;

  SocketBloc(this._socketClientManager, this._chatRespository)
      : super(SocektInitial()) {
    on<OpenSocketConnection>(_onOpenSocket);
    on<GetLastMsgWithUsers>(_onGetLastMsgEvent);
  }

  List<Chat> privateMessages = [];
  final currentUserId = getIt<AuthDatabaseService>().getUserId();

  void _onOpenSocket(OpenSocketConnection event, Emitter<SocketState> emit) {
    _socketClientManager.openSocketConnection();
  }

  void _onGetLastMsgEvent(
      GetLastMsgWithUsers event, Emitter<SocketState> emit) async {
    emit(UserChatsLoading());
    await Future.delayed(const Duration(seconds: 1));
    final result = await _chatRespository.getLastMsgWithUsers();
    result.fold(
      (failure) {
        privateMessages = [];
        emit(UserChatsLoadingFailed(msg: failure.failureMsg!));
      },
      (chats) => emit(UserChatsLoaded(chats: chats)),
    );
  }

  @override
  Future<void> close() {
    _socketClientManager.disconnect();
    return super.close();
  }

  @override
  void onTransition(Transition<SocketEvent, SocketState> transition) {
    super.onTransition(transition);
    log('Socket transition: $transition');
  }
}
