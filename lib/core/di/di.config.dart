// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:japanese_tutorials_app/core/di/register_module.dart' as _i172;
import 'package:japanese_tutorials_app/core/log/logger.dart' as _i659;
import 'package:japanese_tutorials_app/features/router/app_router.dart'
    as _i177;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

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
    gh.singleton<_i659.LoggerService>(() => _i659.LoggerService());
    gh.singleton<_i177.AppRouter>(() => _i177.AppRouter(isTesting: gh<bool>()));
    return this;
  }
}

class _$RegisterModule extends _i172.RegisterModule {}
