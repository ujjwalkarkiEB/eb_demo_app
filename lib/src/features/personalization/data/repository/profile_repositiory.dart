import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:eb_demo_app/core/utils/error/exception/api_exception.dart';
import 'package:eb_demo_app/src/features/personalization/data/model/profile.dart';
import 'package:eb_demo_app/src/features/personalization/data/remote/profile_remote_source.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/utils/error/failure/failure.dart';

abstract class ProfileRepositiory {
  Future<Either<Failure, Profile>> getCurrentUserProfile();
  Future<Either<Failure, void>> updateProfile({String? avatar, String? bio});
}

@LazySingleton(as: ProfileRepositiory)
class ProfileRepositioryImpl implements ProfileRepositiory {
  final ProfileRemoteSource _profileRemoteSource;

  ProfileRepositioryImpl(this._profileRemoteSource);
  @override
  Future<Either<Failure, Profile>> getCurrentUserProfile() async {
    try {
      final result = await _profileRemoteSource.getCurrentUserProfile();
      return right(result);
    } on ApiException catch (e) {
      log(e.toString());
      return left(const ServerFailure('Something went wrong'));
    } catch (e) {
      log('unknown:  e.toString()');
      return left(const UnknownFailure('Something went wrong!'));
    }
  }

  @override
  Future<Either<Failure, void>> updateProfile(
      {String? avatar, String? bio}) async {
    try {
      await _profileRemoteSource.updateProfile(avatar: avatar, bio: bio);
      return right(null);
    } on ApiException catch (e) {
      log(e.toString());
      return left(const ServerFailure('Something went wrong'));
    } catch (e) {
      log('unknown:  e.toString()');
      return left(const UnknownFailure('Something went wrong!'));
    }
  }
}
