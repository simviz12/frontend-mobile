import 'package:injectable/injectable.dart';
import '../domain/device_repository.dart';
import '../domain/device.dart';

@LazySingleton(as: DeviceRepository)
class DeviceRepositoryImpl implements DeviceRepository {
  final List<Device> _mockDevices = [
    Device(
      id: '1',
      name: 'Pixel 7 Pro (Dueño)',
      status: 'connected',
      batteryLevel: 85,
      lastSeen: DateTime.now(),
      isProtected: true,
    ),
    Device(
      id: '2',
      name: 'Galaxy S22 (Secundario)',
      status: 'offline',
      batteryLevel: 12,
      lastSeen: DateTime.now().subtract(const Duration(hours: 2)),
      isProtected: true,
    ),
  ];

  @override
  Future<List<Device>> getDevices() async {
    await Future.delayed(const Duration(seconds: 1));
    return _mockDevices;
  }

  @override
  Future<Device> getDevice(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final device = _mockDevices.firstWhere((d) => d.id == id, orElse: () => throw Exception('Dispositivo no encontrado'));
    return device;
  }

  @override
  Future<void> renameDevice(String id, String newName) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final index = _mockDevices.indexWhere((d) => d.id == id);
    if (index != -1) {
      _mockDevices[index] = _mockDevices[index].copyWith(name: newName);
    }
  }

  @override
  Future<void> unlinkDevice(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    _mockDevices.removeWhere((d) => d.id == id);
  }
}
