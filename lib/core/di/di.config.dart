// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:http/http.dart' as _i519;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:tdd_clean_architecture/core/di/register_module.dart' as _i355;
import 'package:tdd_clean_architecture/core/log/logger.dart' as _i119;
import 'package:tdd_clean_architecture/features/auth/data/data_sources/auth_remote_data_source.dart'
    as _i862;
import 'package:tdd_clean_architecture/features/auth/data/repositories/auth_repo_impl.dart'
    as _i807;
import 'package:tdd_clean_architecture/features/auth/domain/repository/auth_repository.dart'
    as _i79;
import 'package:tdd_clean_architecture/features/auth/domain/usecases/create_user.dart'
    as _i791;
import 'package:tdd_clean_architecture/features/auth/domain/usecases/get_users.dart'
    as _i527;
import 'package:tdd_clean_architecture/features/auth/presentation/cubit/auth_cubit.dart'
    as _i193;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.sharedPreferences,
      preResolve: true,
    );
    gh.singleton<_i119.AppLogger>(() => _i119.AppLogger());
    gh.lazySingleton<_i519.Client>(() => registerModule.provideHttpClient());
    gh.lazySingleton<_i862.AuthRemoteDataSource>(
        () => _i862.AuthRemoteDataSourceImpl(gh<_i519.Client>()));
    gh.lazySingleton<_i79.AuthRepository>(
        () => _i807.AuthRepoImpl(gh<_i862.AuthRemoteDataSource>()));
    gh.factory<_i527.GetUsers>(() => _i527.GetUsers(gh<_i79.AuthRepository>()));
    gh.factory<_i791.CreateUser>(
        () => _i791.CreateUser(gh<_i79.AuthRepository>()));
    gh.factory<_i193.AuthCubit>(() => _i193.AuthCubit(
          createUser: gh<_i791.CreateUser>(),
          getUsers: gh<_i527.GetUsers>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i355.RegisterModule {}
