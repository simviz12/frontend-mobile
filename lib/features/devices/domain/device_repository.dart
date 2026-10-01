import 'device.dart';

abstract class DeviceRepository {
  Future<List<Device>> getDevices();
  Future<Device> getDevice(String id);
  Future<void> renameDevice(String id, String newName);
  Future<void> unlinkDevice(String id);
}
