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
import '../../../src/features/authentication/data/respository/local_auth_repository.dart'
    as _i4;
import '../../../src/features/authentication/data/respository/password_config_repository.dart'
    as _i50;
import '../../../src/features/authentication/presentation/blocs/auth/auth_bloc.dart'
    as _i839;
import '../../../src/features/authentication/presentation/blocs/login_bloc/login_bloc.dart'
    as _i772;
import '../../../src/features/authentication/presentation/blocs/onbaording_bloc/onboarding_bloc.dart'
    as _i205;
import '../../../src/features/authentication/presentation/blocs/otp/otp_bloc.dart'
    as _i155;
import '../../../src/features/authentication/presentation/blocs/password_reset/password_reset_bloc.dart'
    as _i1031;
import '../../../src/features/authentication/presentation/blocs/signup_bloc/signup_bloc.dart'
    as _i124;
import '../../../src/features/chat/data/repository/chat_respository.dart'
    as _i563;
import '../../../src/features/chat/data/source/remote/chat_remote_source.dart'
    as _i192;
import '../../../src/features/chat/presentation/blocs/private_chat/private_chat_room_bloc.dart'
    as _i596;
import '../../../src/features/chat/presentation/blocs/socket/socket_bloc.dart'
    as _i296;
import '../../../src/features/chat/presentation/blocs/usersearch/usersearch_bloc.dart'
    as _i475;
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
import '../../../src/features/shop/data/repository/my_products_repository.dart'
    as _i855;
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
import '../../../src/features/shop/presentation/blocs/myproducts/myproducts_bloc.dart'
    as _i278;
import '../../../src/features/shop/presentation/blocs/product_detail/product_detail_bloc.dart'
    as _i222;
import '../../../src/features/shop/presentation/blocs/store/store_bloc.dart'
    as _i591;
import '../../global_bloc/bloc/internet_bloc.dart' as _i331;
import '../../global_bloc/global/global_bloc.dart' as _i1043;
import '../../global_bloc/session/session_bloc.dart' as _i696;
import '../../utils/helpers/internet_connection_helpers.dart' as _i841;
import '../../utils/helpers/token_services.dart' as _i863;
import '../../utils/local_auth/local_auth_services.dart' as _i329;
import '../../utils/local_storage/database_helper.dart' as _i752;
import '../../utils/network/auth_interceptor/auth_interceptor.dart' as _i752;
import '../../utils/network/client/dio_client.dart' as _i590;
import '../../utils/network/client/graphql_client.dart' as _i322;
import '../../utils/notification/notification_service.dart' as _i857;
import '../../utils/session/session_config.dart' as _i220;
import '../../utils/socket/event_handlers.dart' as _i88;
import '../../utils/socket/socket_client_manager.dart' as _i703;
import '../../utils/socket/socket_setup.dart' as _i541;
import '../route/app_route.dart' as _i193;
import 'register_module.dart' as _i291;

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
    final registerModule = _$RegisterModule();
    gh.factory<_i857.NotificationService>(() => _i857.NotificationService());
    gh.factory<_i1043.GlobalBloc>(() => _i1043.GlobalBloc());
    gh.factory<_i475.UsersearchBloc>(() => _i475.UsersearchBloc());
    gh.singleton<_i193.AppRouter>(() => registerModule.appRouter);
    gh.lazySingleton<_i752.DatabaseHelper>(() => _i752.DatabaseHelper());
    gh.lazySingleton<_i752.AuthInterceptor>(() => _i752.AuthInterceptor());
    gh.lazySingleton<_i841.InternetConnectionHelpers>(
        () => _i841.InternetConnectionHelpers());
    gh.lazySingleton<_i220.SessionManager>(() => _i220.SessionManager());
    gh.factory<_i696.SessionBloc>(
        () => _i696.SessionBloc(gh<_i220.SessionManager>()));
    gh.lazySingleton<_i329.LocalAuthService>(
        () => _i329.LocalAuthService(gh<_i752.DatabaseHelper>()));
    gh.lazySingleton<_i554.ShopDatabaseService>(
        () => _i554.ShopDatabaseServiceImpl(gh<_i752.DatabaseHelper>()));
    gh.lazySingleton<_i590.DioClient>(
        () => _i590.DioClient(gh<_i752.AuthInterceptor>()));
    gh.lazySingleton<_i192.ChatRemoteSource>(
        () => _i192.ChatRemoteSource(gh<_i590.DioClient>()));
    gh.lazySingleton<_i457.AuthDatabaseService>(() =>
        _i457.AuthDatabaseService(databaseHelper: gh<_i752.DatabaseHelper>()));
    gh.lazySingleton<_i563.ChatRespository>(
        () => _i563.ChatRespositoryImpl(gh<_i192.ChatRemoteSource>()));
    gh.lazySingleton<_i322.GraphqlClient>(
        () => _i322.GraphqlClient(dioClient: gh<_i590.DioClient>()));
    gh.lazySingleton<_i331.InternetBloc>(
        () => _i331.InternetBloc(gh<_i841.InternetConnectionHelpers>()));
    gh.lazySingleton<_i4.LocalAuthRepository>(
        () => _i4.LocalAuthRepositoryImpl(gh<_i329.LocalAuthService>()));
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
    gh.lazySingleton<_i541.SocketSetup>(
        () => _i541.SocketSetup(gh<_i863.TokenService>()));
    gh.lazySingleton<_i855.MyProductsRepository>(
        () => _i855.MyProductsRepositoryImpl(
              gh<_i554.ShopDatabaseService>(),
              gh<_i760.ShopRemoteSource>(),
            ));
    gh.lazySingleton<_i50.PasswordConfigRepository>(
        () => _i50.PasswordConfigRepositoryImpl(gh<_i849.AuthRemoteSource>()));
    gh.factory<_i905.PersonalizationBloc>(
        () => _i905.PersonalizationBloc(gh<_i46.ProfileRepositiory>()));
    gh.lazySingleton<_i67.ShopRepository>(
        () => _i67.ShopRepositoryImpl(gh<_i760.ShopRemoteSource>()));
    gh.factory<_i591.StoreBloc>(
        () => _i591.StoreBloc(gh<_i866.StoreRepository>()));
    gh.factory<_i278.MyproductsBloc>(
        () => _i278.MyproductsBloc(gh<_i855.MyProductsRepository>()));
    gh.factory<_i1031.PasswordResetBloc>(
        () => _i1031.PasswordResetBloc(gh<_i50.PasswordConfigRepository>()));
    gh.factory<_i124.SignupBloc>(
        () => _i124.SignupBloc(gh<_i819.AuthRepository>()));
    gh.factory<_i222.ProductDetailBloc>(
        () => _i222.ProductDetailBloc(gh<_i572.ProductRepository>()));
    gh.factory<_i205.OnboardingBloc>(
        () => _i205.OnboardingBloc(gh<_i819.AuthRepository>()));
    gh.factory<_i155.OtpBloc>(() => _i155.OtpBloc(gh<_i819.AuthRepository>()));
    gh.factory<_i772.LoginBloc>(
        () => _i772.LoginBloc(gh<_i819.AuthRepository>()));
    gh.factory<_i553.HomeBloc>(() => _i553.HomeBloc(gh<_i67.ShopRepository>()));
    gh.factory<_i839.AuthBloc>(() => _i839.AuthBloc(
          gh<_i819.AuthRepository>(),
          gh<_i4.LocalAuthRepository>(),
        ));
    gh.lazySingleton<_i88.SocketEventHandlers>(() => _i88.SocketEventHandlers(
          gh<_i541.SocketSetup>(),
          gh<_i857.NotificationService>(),
        ));
    gh.lazySingleton<_i703.SocketClientManager>(() => _i703.SocketClientManager(
          gh<_i541.SocketSetup>(),
          gh<_i88.SocketEventHandlers>(),
        ));
    gh.lazySingleton<_i596.PrivateChatRoomBloc>(() => _i596.PrivateChatRoomBloc(
          gh<_i703.SocketClientManager>(),
          gh<_i563.ChatRespository>(),
        ));
    gh.lazySingleton<_i296.SocketBloc>(() => _i296.SocketBloc(
          gh<_i703.SocketClientManager>(),
          gh<_i563.ChatRespository>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i291.RegisterModule {}
