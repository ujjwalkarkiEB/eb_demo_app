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
import '../../../src/features/personalization/data/remote/profile_remote_source.dart'
    as _i574;
import '../../../src/features/personalization/data/repository/profile_repositiory.dart'
    as _i46;
import '../../../src/features/personalization/presentation/bloc/personalization_bloc.dart'
    as _i905;
import '../../../src/features/shop/data/data_source/local/shop_database_service.dart'
    as _i554;
import '../../../src/features/shop/data/data_source/remote/shop_remote_source.dart'
    as _i760;
import '../../../src/features/shop/data/repository/cart_repository.dart'
    as _i354;
import '../../../src/features/shop/data/repository/product_repository.dart'
    as _i572;
import '../../../src/features/shop/data/repository/shop_repository.dart'
    as _i67;
import '../../../src/features/shop/data/repository/store_repository.dart'
    as _i866;
import '../../../src/features/shop/presentation/blocs/cart/cart_bloc.dart'
    as _i773;
import '../../../src/features/shop/presentation/blocs/home/home_bloc.dart'
    as _i553;
import '../../../src/features/shop/presentation/blocs/product_detail/product_detail_bloc.dart'
    as _i222;
import '../../../src/features/shop/presentation/blocs/store/store_bloc.dart'
    as _i591;
import '../../utils/helpers/token_services.dart' as _i863;
import '../../utils/local_storage/database_helper.dart' as _i752;
import '../../utils/network/auth_interceptor/auth_interceptor.dart' as _i752;
import '../../utils/network/client/dio_client.dart' as _i590;
import '../../utils/network/client/graphql_client.dart' as _i322;
import '../../utils/notification/notification_service.dart' as _i857;

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
    gh.lazySingleton<_i752.DatabaseHelper>(() => _i752.DatabaseHelper());
    gh.lazySingleton<_i857.NotificationService>(
        () => _i857.NotificationService());
    gh.lazySingleton<_i752.AuthInterceptor>(() => _i752.AuthInterceptor());
    gh.lazySingleton<_i554.ShopDatabaseService>(
        () => _i554.ShopDatabaseServiceImpl(gh<_i752.DatabaseHelper>()));
    gh.lazySingleton<_i590.DioClient>(
        () => _i590.DioClient(gh<_i752.AuthInterceptor>()));
    gh.lazySingleton<_i457.AuthDatabaseService>(() =>
        _i457.AuthDatabaseService(databaseHelper: gh<_i752.DatabaseHelper>()));
    gh.lazySingleton<_i322.GraphqlClient>(
        () => _i322.GraphqlClient(dioClient: gh<_i590.DioClient>()));
    gh.lazySingleton<_i354.CartRepository>(
        () => _i354.CartRepositoryImpl(gh<_i554.ShopDatabaseService>()));
    gh.lazySingleton<_i863.TokenService>(() => _i863.TokenServiceImpl(
          gh<_i457.AuthDatabaseService>(),
          gh<_i590.DioClient>(),
        ));
    gh.lazySingleton<_i849.AuthRemoteSource>(
        () => _i849.AuthRemoteSourceImpl(gh<_i590.DioClient>()));
    gh.lazySingleton<_i574.ProfileRemoteSource>(
        () => _i574.ProfileRemoteSourceImpl(gh<_i590.DioClient>()));
    gh.factory<_i773.CartBloc>(
        () => _i773.CartBloc(gh<_i354.CartRepository>()));
    gh.lazySingleton<_i760.ShopRemoteSource>(
        () => _i760.ShopRemoteSourceImpl(gh<_i322.GraphqlClient>()));
    gh.lazySingleton<_i572.ProductRepository>(
        () => _i572.ProductRepositoryImpl(gh<_i760.ShopRemoteSource>()));
    gh.lazySingleton<_i819.AuthRepository>(() => _i819.AuthReposeitoryImpl(
          authRemoteSource: gh<_i849.AuthRemoteSource>(),
          authDatabaseService: gh<_i457.AuthDatabaseService>(),
        ));
    gh.lazySingleton<_i866.StoreRepository>(() => _i866.StoreRepositoryImpl(
          gh<_i760.ShopRemoteSource>(),
          gh<_i554.ShopDatabaseService>(),
        ));
    gh.lazySingleton<_i46.ProfileRepositiory>(
        () => _i46.ProfileRepositioryImpl(gh<_i574.ProfileRemoteSource>()));
    gh.factory<_i905.PersonalizationBloc>(
        () => _i905.PersonalizationBloc(gh<_i46.ProfileRepositiory>()));
    gh.lazySingleton<_i67.ShopRepository>(
        () => _i67.ShopRepositoryImpl(gh<_i760.ShopRemoteSource>()));
    gh.factory<_i591.StoreBloc>(
        () => _i591.StoreBloc(gh<_i866.StoreRepository>()));
    gh.factory<_i124.SignupBloc>(
        () => _i124.SignupBloc(gh<_i819.AuthRepository>()));
    gh.factory<_i222.ProductDetailBloc>(
        () => _i222.ProductDetailBloc(gh<_i572.ProductRepository>()));
    gh.factory<_i205.OnboardingBloc>(
        () => _i205.OnboardingBloc(gh<_i819.AuthRepository>()));
    gh.factory<_i839.AuthBloc>(
        () => _i839.AuthBloc(gh<_i819.AuthRepository>()));
    gh.factory<_i155.OtpBloc>(() => _i155.OtpBloc(gh<_i819.AuthRepository>()));
    gh.factory<_i772.LoginBloc>(
        () => _i772.LoginBloc(gh<_i819.AuthRepository>()));
    gh.factory<_i553.HomeBloc>(() => _i553.HomeBloc(gh<_i67.ShopRepository>()));
    return this;
  }
}
