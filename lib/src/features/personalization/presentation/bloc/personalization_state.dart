part of 'personalization_bloc.dart';

sealed class PersonalizationState extends Equatable {
  const PersonalizationState();

  @override
  List<Object> get props => [];
}

final class PersonalizationInitial extends PersonalizationState {}

final class ProfileFetchLoading extends PersonalizationState {}

final class ProfileFetched extends PersonalizationState {
  final Profile currentUser;

  const ProfileFetched({required this.currentUser});
}

final class ProfileFetchingError extends PersonalizationState {}

final class ProfileUpdateSuccessful extends PersonalizationState {}

final class ProfileUpdateFailure extends PersonalizationState {}
