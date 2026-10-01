import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/di/injection.dart';
import '../domain/device_usecases.dart';
import '../domain/device.dart';

part 'devices_notifier.freezed.dart';

@freezed
class DevicesState with _$DevicesState {
  const factory DevicesState.loading() = _Loading;
  const factory DevicesState.loaded(List<Device> devices) = _Loaded;
  const factory DevicesState.error(String message) = _Error;
}

class DevicesNotifier extends StateNotifier<DevicesState> {
  final ListDevices _listDevices;

  DevicesNotifier(this._listDevices) : super(const DevicesState.loading()) {
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
}

final devicesNotifierProvider = StateNotifierProvider<DevicesNotifier, DevicesState>((ref) {
  return DevicesNotifier(getIt<ListDevices>());
});
