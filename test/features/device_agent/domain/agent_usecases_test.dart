import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:guardian_mobile/features/device_agent/domain/agent_repository.dart';
import 'package:guardian_mobile/features/device_agent/domain/agent_usecases.dart';

class MockAgentRepository extends Mock implements AgentRepository {}

void main() {
  late MockAgentRepository mockRepository;
  late RequestDeviceAdmin requestDeviceAdmin;
  late CheckAdminActive checkAdminActive;
  late ExecuteCommandLocally executeCommandLocally;

  setUp(() {
    mockRepository = MockAgentRepository();
    requestDeviceAdmin = RequestDeviceAdmin(mockRepository);
    checkAdminActive = CheckAdminActive(mockRepository);
    executeCommandLocally = ExecuteCommandLocally(mockRepository);
  });

  test('RequestDeviceAdmin should delegate to repository', () async {
    when(() => mockRepository.requestAdmin()).thenAnswer((_) async => true);

    final result = await requestDeviceAdmin();

    expect(result, isTrue);
    verify(() => mockRepository.requestAdmin()).called(1);
  });

  test('CheckAdminActive should delegate to repository', () async {
    when(() => mockRepository.isAdminActive()).thenAnswer((_) async => true);

    final result = await checkAdminActive();

    expect(result, isTrue);
    verify(() => mockRepository.isAdminActive()).called(1);
  });

  group('ExecuteCommandLocally', () {
    test('ring command invokes ringAlarm', () async {
      when(() => mockRepository.ringAlarm()).thenAnswer((_) async {});

      await executeCommandLocally('ring');

      verify(() => mockRepository.ringAlarm()).called(1);
    });

    test('vibrate command invokes vibrate', () async {
      when(() => mockRepository.vibrate()).thenAnswer((_) async {});

      await executeCommandLocally('vibrate');

      verify(() => mockRepository.vibrate()).called(1);
    });

    test('lock command invokes lockDevice', () async {
      when(() => mockRepository.lockDevice()).thenAnswer((_) async {});

      await executeCommandLocally('lock');

      verify(() => mockRepository.lockDevice()).called(1);
    });

    test('wipe command invokes wipeDevice', () async {
      when(() => mockRepository.wipeDevice()).thenAnswer((_) async {});

      await executeCommandLocally('wipe');

      verify(() => mockRepository.wipeDevice()).called(1);
    });

    test('theftMode command invokes lockDevice and ringAlarm', () async {
      when(() => mockRepository.lockDevice()).thenAnswer((_) async {});
      when(() => mockRepository.ringAlarm()).thenAnswer((_) async {});

      await executeCommandLocally('theftMode');

      verify(() => mockRepository.lockDevice()).called(1);
      verify(() => mockRepository.ringAlarm()).called(1);
    });
  });
}
