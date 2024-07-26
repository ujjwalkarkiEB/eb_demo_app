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
  }

  void _profileFetch(ProfileFetchRequestEvent event,
      Emitter<PersonalizationState> emit) async {
    final result = await _profileRepositiory.getCurrentUserProfile();
    result.fold(
      (l) => emit(ProfileFetchingError()),
      (r) => emit(ProfileFetched(currentUser: r)),
    );
  }

  void _profileUpdate(
      ProfileUpdateEvent event, Emitter<PersonalizationState> emit) async {
    final result = await _profileRepositiory.updateProfile(
        avatar: event.avatar, bio: event.bio);

    result.fold(
      (l) => emit,
      (r) => emit(ProfileUpdateSuccessful()),
    );
  }
}
