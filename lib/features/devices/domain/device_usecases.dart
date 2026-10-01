import 'package:injectable/injectable.dart';
import 'device_repository.dart';
import 'device.dart';

@injectable
class ListDevices {
  final DeviceRepository _repository;

  ListDevices(this._repository);

  Future<List<Device>> call() {
    return _repository.getDevices();
  }
}

@injectable
class GetDevice {
  final DeviceRepository _repository;

  GetDevice(this._repository);

  Future<Device> call(String id) {
    return _repository.getDevice(id);
  }
}
