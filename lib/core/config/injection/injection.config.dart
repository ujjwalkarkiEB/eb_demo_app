// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../../src/features/authentication/data/data_source/local/auth_database_service.dart'
    as _i457;
import '../../../src/features/authentication/data/data_source/remote/auth_remote_service.dart'
    as _i849;
import '../../../src/features/authentication/data/respository/auth_repository.dart'
    as _i819;
import '../../../src/features/authentication/presentation/blocs/auth/auth_bloc.dart'
    as _i839;
import '../../../src/features/authentication/presentation/blocs/login_bloc/login_bloc.dart'
    as _i772;
import '../../../src/features/authentication/presentation/blocs/onbaording_bloc/onboarding_bloc.dart'
    as _i205;
import '../../../src/features/authentication/presentation/blocs/otp/otp_bloc.dart'
    as _i155;
import '../../../src/features/authentication/presentation/blocs/signup_bloc/signup_bloc.dart'
    as _i124;
import '../../../src/features/shop/presentation/blocs/home/home_bloc.dart'
    as _i553;
import '../../utils/helpers/token_services.dart' as _i863;
import '../../utils/local_storage/database_helper.dart' as _i752;
import '../../utils/network/auth_interceptor/auth_interceptor.dart' as _i752;
import '../../utils/network/client/dio_client.dart' as _i590;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i772.LoginBloc>(() => _i772.LoginBloc());
    gh.factory<_i553.HomeBloc>(() => _i553.HomeBloc());
    gh.lazySingleton<_i752.AuthInterceptor>(() => _i752.AuthInterceptor());
    gh.lazySingleton<_i752.DatabaseHelper>(() => _i752.DatabaseHelper());
    gh.lazySingleton<_i590.DioClient>(
        () => _i590.DioClient(gh<_i752.AuthInterceptor>()));
    gh.lazySingleton<_i457.AuthDatabaseService>(() =>
        _i457.AuthDatabaseService(databaseHelper: gh<_i752.DatabaseHelper>()));
    gh.lazySingleton<_i863.TokenService>(() => _i863.TokenServiceImpl(
          gh<_i457.AuthDatabaseService>(),
          gh<_i590.DioClient>(),
        ));
    gh.lazySingleton<_i849.AuthRemoteSource>(
        () => _i849.AuthRemoteSourceImpl(gh<_i590.DioClient>()));
    gh.lazySingleton<_i819.AuthRepository>(() => _i819.AuthReposeitoryImpl(
          authRemoteSource: gh<_i849.AuthRemoteSource>(),
          authDatabaseService: gh<_i457.AuthDatabaseService>(),
        ));
    gh.factory<_i124.SignupBloc>(
        () => _i124.SignupBloc(gh<_i819.AuthRepository>()));
    gh.factory<_i205.OnboardingBloc>(
        () => _i205.OnboardingBloc(gh<_i819.AuthRepository>()));
    gh.factory<_i839.AuthBloc>(
        () => _i839.AuthBloc(gh<_i819.AuthRepository>()));
    gh.factory<_i155.OtpBloc>(() => _i155.OtpBloc(gh<_i819.AuthRepository>()));
    return this;
  }
}
