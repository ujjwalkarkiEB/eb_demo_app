part of 'personalization_bloc.dart';

sealed class PersonalizationEvent extends Equatable {
  const PersonalizationEvent();

  @override
  List<Object> get props => [];
}

final class ProfileUpdateEvent extends PersonalizationEvent {
  final String? avatar;
  final String? bio;

  const ProfileUpdateEvent({required this.avatar, required this.bio});
}

final class ProfileFetchRequestEvent extends PersonalizationEvent {}

final class ProfileDataFetchRequestEvent extends PersonalizationEvent {
  final String profileId;

  const ProfileDataFetchRequestEvent({required this.profileId});
}
