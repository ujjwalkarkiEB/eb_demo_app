import 'package:bloc/bloc.dart';
import 'package:eb_demo_app/src/features/authentication/data/respository/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

@injectable
class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  int _currentPageIndex = 0;
  final AuthRepository _authRepository;
  OnboardingBloc(this._authRepository) : super(OnboardingInitial()) {
    on<SkipButtonEvent>(_onSkipEvent);
    on<OnboardingNextPageEvent>(_onNextPageEvent);
  }

  void _onSkipEvent(
      SkipButtonEvent event, Emitter<OnboardingState> emit) async {
    await _authRepository.setVisitFlag();
    emit(OnboardingCompleted());
  }

  void _onNextPageEvent(
      OnboardingNextPageEvent event, Emitter<OnboardingState> emit) async {
    _currentPageIndex++;
    if (_currentPageIndex > 2) {
      await _authRepository.setVisitFlag();

      emit(OnboardingCompleted());
    } else {
      emit(OnboardingNextPage(nextPage: _currentPageIndex));
    }
  }
}
