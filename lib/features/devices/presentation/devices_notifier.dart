import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/di/injection.dart';
import '../domain/device_usecases.dart';
import '../domain/device.dart';

part 'devices_notifier.freezed.dart';

@freezed
sealed class DevicesState with _$DevicesState {
  const factory DevicesState.loading() = _Loading;
  const factory DevicesState.loaded(List<Device> devices) = _Loaded;
  const factory DevicesState.error(String message) = _Error;
}

class DevicesNotifier extends StateNotifier<DevicesState> {
  final ListDevices _listDevices;
  final RenameDevice _renameDevice;
  final UnlinkDevice _unlinkDevice;

  DevicesNotifier(this._listDevices, this._renameDevice, this._unlinkDevice) : super(const DevicesState.loading()) {
    loadDevices();
  }

  Future<void> loadDevices() async {
    state = const DevicesState.loading();
    try {
      final devices = await _listDevices();
      state = DevicesState.loaded(devices);
    } catch (e) {
      state = DevicesState.error(e.toString());
    }
  }

  Future<void> rename(String id, String newName) async {
    try {
      await _renameDevice(id, newName);
      await loadDevices(); // Reload to get updated list
    } catch (e) {
      // Show error ideally
    }
  }

  Future<void> unlink(String id) async {
    try {
      await _unlinkDevice(id);
      await loadDevices();
    } catch (e) {
      // Show error ideally
    }
  }
}

final devicesNotifierProvider = StateNotifierProvider<DevicesNotifier, DevicesState>((ref) {
  return DevicesNotifier(
    getIt<ListDevices>(),
    getIt<RenameDevice>(),
    getIt<UnlinkDevice>(),
  );
});
