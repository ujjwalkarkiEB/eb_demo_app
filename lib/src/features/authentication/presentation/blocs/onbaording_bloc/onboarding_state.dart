part of 'onboarding_bloc.dart';

sealed class OnboardingState extends Equatable {
  const OnboardingState();

  @override
  List<Object> get props => [];
}

class OnboardingInitial extends OnboardingState {}

class OnboardingNextPage extends OnboardingState {
  final int nextPage;

  const OnboardingNextPage({required this.nextPage});
  @override
  List<Object> get props => [nextPage];
}

final class OnboardingCompleted extends OnboardingState {}
