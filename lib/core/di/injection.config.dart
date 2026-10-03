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
import '../../features/commands/data/command_repository_impl.dart' as _i931;
import '../../features/commands/domain/command_repository.dart' as _i106;
import '../../features/commands/domain/get_commands_history.dart' as _i676;
import '../../features/commands/domain/send_command.dart' as _i1007;
import '../../features/devices/data/device_repository_impl.dart' as _i626;
import '../../features/devices/domain/device_repository.dart' as _i960;
import '../../features/devices/domain/device_usecases.dart' as _i589;
import '../../features/devices/domain/link_device.dart' as _i896;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i896.LinkDevice>(() => _i896.LinkDevice());
    gh.lazySingleton<_i960.DeviceRepository>(
      () => _i626.DeviceRepositoryImpl(),
    );
    gh.lazySingleton<_i106.CommandRepository>(
      () => _i931.CommandRepositoryImpl(),
    );
    gh.lazySingleton<_i996.AuthRepository>(() => _i781.AuthRepositoryImpl());
    gh.factory<_i676.GetCommandsHistory>(
      () => _i676.GetCommandsHistory(gh<_i106.CommandRepository>()),
    );
    gh.factory<_i1007.SendCommand>(
      () => _i1007.SendCommand(gh<_i106.CommandRepository>()),
    );
    gh.factory<_i645.LoginUser>(
      () => _i645.LoginUser(gh<_i996.AuthRepository>()),
    );
    gh.factory<_i589.ListDevices>(
      () => _i589.ListDevices(gh<_i960.DeviceRepository>()),
    );
    gh.factory<_i589.GetDevice>(
      () => _i589.GetDevice(gh<_i960.DeviceRepository>()),
    );
    gh.factory<_i589.RenameDevice>(
      () => _i589.RenameDevice(gh<_i960.DeviceRepository>()),
    );
    gh.factory<_i589.UnlinkDevice>(
      () => _i589.UnlinkDevice(gh<_i960.DeviceRepository>()),
    );
    return this;
  }
}
