import 'device.dart';

abstract class DeviceRepository {
  Future<List<Device>> getDevices();
  Future<Device> getDevice(String id);
}
