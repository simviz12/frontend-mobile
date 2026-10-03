import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import '../domain/agent_repository.dart';

@LazySingleton(as: AgentRepository)
class AgentChannelImpl implements AgentRepository {
  static const MethodChannel _channel = MethodChannel('com.simviz12.guardian_mobile/agent');

  @override
  Future<bool> requestAdmin() async {
    final result = await _channel.invokeMethod<bool>('requestAdmin');
    return result ?? false;
  }

  @override
  Future<bool> isAdminActive() async {
    final result = await _channel.invokeMethod<bool>('isAdminActive');
    return result ?? false;
  }

  @override
  Future<void> lockDevice() async {
    await _channel.invokeMethod('lock');
  }

  @override
  Future<void> wipeDevice() async {
    await _channel.invokeMethod('wipe');
  }

  @override
  Future<void> ringAlarm() async {
    await _channel.invokeMethod('ring');
  }

  @override
  Future<void> vibrate() async {
    await _channel.invokeMethod('vibrate');
  }
}
