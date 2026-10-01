import 'package:injectable/injectable.dart';
import '../domain/auth_repository.dart';
import '../domain/user.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<User> login({required String email, required String password}) async {
    // Mock network delay
    await Future.delayed(const Duration(seconds: 2));

    if (email == 'admin@guardian.com' && password == 'password123') {
      return const User(
        id: '1',
        email: 'admin@guardian.com',
        name: 'Admin User',
        token: 'mock_token_123',
      );
    } else {
      throw Exception('Credenciales inválidas');
    }
  }

  @override
  Future<void> logout() async {
    await Future.delayed(const Duration(seconds: 1));
  }
}
