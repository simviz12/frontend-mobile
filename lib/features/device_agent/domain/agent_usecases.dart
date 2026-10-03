import 'package:injectable/injectable.dart';
import 'agent_repository.dart';

@injectable
class RequestDeviceAdmin {
  final AgentRepository repository;
  RequestDeviceAdmin(this.repository);
  Future<bool> call() => repository.requestAdmin();
}

@injectable
class CheckAdminActive {
  final AgentRepository repository;
  CheckAdminActive(this.repository);
  Future<bool> call() => repository.isAdminActive();
}

@injectable
class ExecuteCommandLocally {
  final AgentRepository repository;
  ExecuteCommandLocally(this.repository);
  
  Future<void> call(String commandType) async {
    switch(commandType) {
      case 'ring':
        await repository.ringAlarm();
        break;
      case 'vibrate':
        await repository.vibrate();
        break;
      case 'lock':
        await repository.lockDevice();
        break;
      case 'wipe':
        await repository.wipeDevice();
        break;
    }
  }
}
