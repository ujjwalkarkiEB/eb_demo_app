import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

part 'global_event.dart';
part 'global_state.dart';

@injectable
class GlobalBloc extends Bloc<GlobalStatusEvent, GlobalStatusState> {
  GlobalBloc() : super(InitialState()) {
    on<RefreshDataEvent>((event, emit) {
      emit(RefreshState(refershType: event.refreshType));
    });
  }
}
