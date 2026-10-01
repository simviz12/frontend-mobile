// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/auth_repository_impl.dart' as _i781;
import '../../features/auth/domain/auth_repository.dart' as _i996;
import '../../features/auth/domain/login_user.dart' as _i645;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i996.AuthRepository>(() => _i781.AuthRepositoryImpl());
    gh.factory<_i645.LoginUser>(
      () => _i645.LoginUser(gh<_i996.AuthRepository>()),
    );
    return this;
  }
}
