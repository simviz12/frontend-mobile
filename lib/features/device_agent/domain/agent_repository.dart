abstract class AgentRepository {
  Future<bool> requestAdmin();
  Future<bool> isAdminActive();
  Future<void> lockDevice();
  Future<void> wipeDevice();
  Future<void> ringAlarm();
  Future<void> vibrate();
}
