import 'package:bloc/bloc.dart';
import 'package:eb_demo_app/src/features/personalization/data/model/profile.dart';
import 'package:eb_demo_app/src/features/personalization/data/remote/profile_remote_source.dart';
import 'package:eb_demo_app/src/features/personalization/data/repository/profile_repositiory.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'personalization_event.dart';
part 'personalization_state.dart';

@injectable
class PersonalizationBloc
    extends Bloc<PersonalizationEvent, PersonalizationState> {
  final ProfileRepositiory _profileRepositiory;
  PersonalizationBloc(this._profileRepositiory)
      : super(PersonalizationInitial()) {
    on<ProfileFetchRequestEvent>(_profileFetch);
    on<ProfileUpdateEvent>(_profileUpdate);
    on<ProfileDataFetchRequestEvent>(_onProfileDataFetch);
  }

  void _profileFetch(ProfileFetchRequestEvent event,
      Emitter<PersonalizationState> emit) async {
    emit(ProfileFetchLoading());
    print('hrer');
    final result = await _profileRepositiory.getCurrentUserProfileId();
    result.fold(
      (l) => emit(ProfileFetchingError()),
      (id) {
        add(ProfileDataFetchRequestEvent(profileId: id));
      },
    );
  }

  void _profileUpdate(
      ProfileUpdateEvent event, Emitter<PersonalizationState> emit) async {
    emit(ProfileUpdateLoading());
    await Future.delayed(const Duration(seconds: 1));
    final result = await _profileRepositiory.updateProfile(
        avatar: event.avatar, bio: event.bio);

    result.fold(
      (l) => emit(ProfileUpdateFailure()),
      (r) => emit(ProfileUpdateSuccessful()),
    );
  }

  void _onProfileDataFetch(ProfileDataFetchRequestEvent event,
      Emitter<PersonalizationState> emit) async {
    final result = await _profileRepositiory.getCurrentUserProfileData(
        profileId: event.profileId);
    result.fold(
      (l) => emit(ProfileFetchingError()),
      (profile) => emit(ProfileFetched(currentUser: profile)),
    );
  }

  @override
  void onTransition(
      Transition<PersonalizationEvent, PersonalizationState> transition) {
    // TODO: implement onTransition
    super.onTransition(transition);
    print(transition);
  }
}
