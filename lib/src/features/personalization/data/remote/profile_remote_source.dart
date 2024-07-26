import 'package:dio/dio.dart';
import 'package:eb_demo_app/core/utils/base/base_remote_source.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/utils/network/client/dio_client.dart';
import '../model/profile.dart';

abstract class ProfileRemoteSource {
  Future<Profile> getCurrentUserProfile();
  Future<void> updateProfile({String? avatar, String? bio});
}

@LazySingleton(as: ProfileRemoteSource)
class ProfileRemoteSourceImpl extends BaseRemoteSource
    implements ProfileRemoteSource {
  ProfileRemoteSourceImpl(DioClient client) : super(client.dio);

  @override
  Future<Profile> getCurrentUserProfile() {
    throw UnimplementedError;
    // return networkRequest<Profile>(
    //   request: (dio) => dio.request("/profile"),
    //   onResponse: (data) => Profile.fromJson(data['data']),
    // );
  }

  @override
  Future<void> updateProfile({String? avatar, String? bio}) {
    final formData = FormData.fromMap({
      'avatar': avatar,
      'bio': bio,
    });
    return networkRequest(
        request: (dio) => dio.post(
              "/profile/",
              data: formData,
            ),
        responseType: false);
  }
}
