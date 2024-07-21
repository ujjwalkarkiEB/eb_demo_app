import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  int _currentPageIndex = 0;
  OnboardingBloc() : super(OnboardingInitial()) {
    on<SkipButtonEvent>(_onSkipEvent);
    on<OnboardingNextPageEvent>(_onNextPageEvent);
  }

  void _onSkipEvent(SkipButtonEvent event, Emitter<OnboardingState> emit) {
    emit(OnboardingCompleted());
  }

  void _onNextPageEvent(
      OnboardingNextPageEvent event, Emitter<OnboardingState> emit) {
    _currentPageIndex++;
    if (_currentPageIndex > 2) {
      emit(OnboardingCompleted());
    } else {
      emit(OnboardingNextPage(nextPage: _currentPageIndex));
    }
  }
}
