part of 'onboarding_bloc.dart';

sealed class OnboardingEvent extends Equatable {
  const OnboardingEvent();

  @override
  List<Object> get props => [];
}

class SkipButtonEvent extends OnboardingEvent {}

class OnboardingNextPageEvent extends OnboardingEvent {}
