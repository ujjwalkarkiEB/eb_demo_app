import 'package:dio/dio.dart';
import 'package:eb_demo_app/core/config/injection/injection.dart';
import 'package:eb_demo_app/core/utils/base/base_remote_source.dart';
import 'package:eb_demo_app/core/utils/error/exception/api_exception.dart';
import 'package:eb_demo_app/core/utils/helpers/token_services.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/utils/network/client/dio_client.dart';
import '../model/profile.dart';

abstract class ProfileRemoteSource {
  Future<Profile> getProfileData(String profileID);
  Future<String> getCurrentUserProfileID();
  Future<void> updateProfile({String? avatar, String? bio});
  Future<void> logOut();
}

@LazySingleton(as: ProfileRemoteSource)
class ProfileRemoteSourceImpl extends BaseRemoteSource
    implements ProfileRemoteSource {
  ProfileRemoteSourceImpl(DioClient client) : super(client.dio);

  @override
  Future<Profile> getProfileData(String profileID) {
    return networkRequest<Profile>(
      request: (dio) => dio.get("/profile/$profileID"),
      onResponse: (data) {
        return Profile.fromJson(data['data']);
      },
    );
  }

  @override
  Future<void> updateProfile({String? avatar, String? bio}) {
    print('bio: ${bio.runtimeType}');
    print('avatra: $avatar');
    final Map<String, dynamic> formData = {
      if (avatar != null) 'avatar': avatar,
      if (bio != null) 'bio': bio,
    };
    print('form data: $formData');
    return networkRequest(
      request: (dio) => dio.patch(
        "/profile/",
        data: formData,
      ),
      responseType: false,
    );
  }

  @override
  Future<void> logOut() async {
    try {
      await getIt<TokenService>().clearTokens();
    } catch (e) {
      throw UnknownException('Erro while logging out: ${e.toString()}');
    }
  }

  @override
  Future<String> getCurrentUserProfileID() async {
    return networkRequest<String>(
      request: (dio) => dio.get("/profile"),
      onResponse: (data) {
        return data['data']['_id'];
      },
    );
  }
}
