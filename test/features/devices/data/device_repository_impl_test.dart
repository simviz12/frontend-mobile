import 'package:flutter_test/flutter_test.dart';
import 'package:guardian_mobile/features/devices/data/device_repository_impl.dart';

void main() {
  late DeviceRepositoryImpl repository;

  setUp(() {
    repository = DeviceRepositoryImpl();
  });

  test('getDevices returns initial list of mock devices', () async {
    final devices = await repository.getDevices();
    expect(devices.length, 2);
  });

  test('getDevice returns correct device when found', () async {
    final device = await repository.getDevice('1');
    expect(device.id, '1');
    expect(device.name, contains('Pixel 7 Pro'));
  });

  test('getDevice throws exception when device not found', () async {
    expect(() => repository.getDevice('999'), throwsA(isA<Exception>()));
  });

  test('renameDevice updates device name', () async {
    await repository.renameDevice('1', 'Renamed Device');
    final updated = await repository.getDevice('1');
    expect(updated.name, 'Renamed Device');
  });

  test('unlinkDevice removes device from repository', () async {
    await repository.unlinkDevice('1');
    final devices = await repository.getDevices();
    expect(devices.any((d) => d.id == '1'), isFalse);
  });
}
