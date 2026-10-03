import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:guardian_mobile/features/devices/domain/device.dart';
import 'package:guardian_mobile/features/devices/domain/device_repository.dart';
import 'package:guardian_mobile/features/devices/domain/device_usecases.dart';

class MockDeviceRepository extends Mock implements DeviceRepository {}

void main() {
  late MockDeviceRepository mockRepository;
  late ListDevices listDevices;
  late GetDevice getDevice;
  late RenameDevice renameDevice;
  late UnlinkDevice unlinkDevice;

  setUp(() {
    mockRepository = MockDeviceRepository();
    listDevices = ListDevices(mockRepository);
    getDevice = GetDevice(mockRepository);
    renameDevice = RenameDevice(mockRepository);
    unlinkDevice = UnlinkDevice(mockRepository);
  });

  final tDevice = Device(
    id: 'dev-1',
    name: 'Pixel 7',
    status: 'connected',
    batteryLevel: 80,
    lastSeen: DateTime(2026, 1, 1),
    isProtected: true,
  );

  group('ListDevices', () {
    test('should return list of devices from repository', () async {
      when(
        () => mockRepository.getDevices(),
      ).thenAnswer((_) async => [tDevice]);

      final result = await listDevices();

      expect(result, [tDevice]);
      verify(() => mockRepository.getDevices()).called(1);
    });
  });

  group('GetDevice', () {
    test('should return a specific device by id', () async {
      when(
        () => mockRepository.getDevice('dev-1'),
      ).thenAnswer((_) async => tDevice);

      final result = await getDevice('dev-1');

      expect(result, tDevice);
      verify(() => mockRepository.getDevice('dev-1')).called(1);
    });
  });

  group('RenameDevice', () {
    test('should delegate rename to repository', () async {
      when(
        () => mockRepository.renameDevice('dev-1', 'Pixel New Name'),
      ).thenAnswer((_) async {});

      await renameDevice('dev-1', 'Pixel New Name');

      verify(
        () => mockRepository.renameDevice('dev-1', 'Pixel New Name'),
      ).called(1);
    });
  });

  group('UnlinkDevice', () {
    test('should delegate unlink to repository', () async {
      when(() => mockRepository.unlinkDevice('dev-1')).thenAnswer((_) async {});

      await unlinkDevice('dev-1');

      verify(() => mockRepository.unlinkDevice('dev-1')).called(1);
    });
  });
}
