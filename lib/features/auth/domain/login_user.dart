import 'package:injectable/injectable.dart';
import 'auth_repository.dart';
import 'user.dart';

@injectable
class LoginUser {
  final AuthRepository _repository;

  LoginUser(this._repository);

  Future<User> call({required String email, required String password}) async {
    if (email.isEmpty || password.isEmpty) {
      throw Exception('Email and password cannot be empty');
    }
    return await _repository.login(email: email, password: password);
  }
}
