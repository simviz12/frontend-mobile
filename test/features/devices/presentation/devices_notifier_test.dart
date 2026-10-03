import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:guardian_mobile/features/devices/domain/device.dart';
import 'package:guardian_mobile/features/devices/domain/device_usecases.dart';
import 'package:guardian_mobile/features/devices/presentation/devices_notifier.dart';

class MockListDevices extends Mock implements ListDevices {}

class MockRenameDevice extends Mock implements RenameDevice {}

class MockUnlinkDevice extends Mock implements UnlinkDevice {}

void main() {
  late MockListDevices mockListDevices;
  late MockRenameDevice mockRenameDevice;
  late MockUnlinkDevice mockUnlinkDevice;
  late DevicesNotifier notifier;

  setUp(() {
    mockListDevices = MockListDevices();
    mockRenameDevice = MockRenameDevice();
    mockUnlinkDevice = MockUnlinkDevice();

    // We don't initialize here to easily mock before constructor
  });

  final tDevices = [
    Device(
      id: '1',
      name: 'Device 1',
      status: 'connected',
      batteryLevel: 100,
      lastSeen: DateTime.now(),
      isProtected: true,
    ),
    Device(
      id: '2',
      name: 'Device 2',
      status: 'offline',
      batteryLevel: 50,
      lastSeen: DateTime.now(),
      isProtected: false,
    ),
  ];

  test('initial state should be loading and fetch devices', () async {
    when(() => mockListDevices()).thenAnswer((_) async => tDevices);

    notifier = DevicesNotifier(
      mockListDevices,
      mockRenameDevice,
      mockUnlinkDevice,
    );
    expect(notifier.state, const DevicesState.loading());

    // Wait for microtasks (initialization)
    await Future.microtask(() {});

    expect(notifier.state, DevicesState.loaded(tDevices));
    verify(() => mockListDevices()).called(1);
  });

  test('should emit error when fetching devices fails', () async {
    when(() => mockListDevices()).thenThrow(Exception('Failed to fetch'));

    notifier = DevicesNotifier(
      mockListDevices,
      mockRenameDevice,
      mockUnlinkDevice,
    );

    await Future.microtask(() {});

    expect(
      notifier.state,
      const DevicesState.error('Exception: Failed to fetch'),
    );
  });

  test('rename should invoke RenameDevice and reload devices', () async {
    when(() => mockListDevices()).thenAnswer((_) async => tDevices);
    when(() => mockRenameDevice('1', 'New Name')).thenAnswer((_) async {});

    notifier = DevicesNotifier(
      mockListDevices,
      mockRenameDevice,
      mockUnlinkDevice,
    );
    await Future.microtask(() {});

    await notifier.rename('1', 'New Name');

    verify(() => mockRenameDevice('1', 'New Name')).called(1);
    verify(() => mockListDevices()).called(2); // Initial + reload
  });

  test('unlink should invoke UnlinkDevice and reload devices', () async {
    when(() => mockListDevices()).thenAnswer((_) async => tDevices);
    when(() => mockUnlinkDevice('1')).thenAnswer((_) async {});

    notifier = DevicesNotifier(
      mockListDevices,
      mockRenameDevice,
      mockUnlinkDevice,
    );
    await Future.microtask(() {});

    await notifier.unlink('1');

    verify(() => mockUnlinkDevice('1')).called(1);
    verify(() => mockListDevices()).called(2); // Initial + reload
  });
}
