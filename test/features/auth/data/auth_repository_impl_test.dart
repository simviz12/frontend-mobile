import 'package:flutter_test/flutter_test.dart';
import 'package:guardian_mobile/features/auth/data/auth_repository_impl.dart';

void main() {
  late AuthRepositoryImpl repository;

  setUp(() {
    repository = AuthRepositoryImpl();
  });

  test('login with valid credentials returns User', () async {
    final user = await repository.login(
      email: 'admin@guardian.com',
      password: 'password123',
    );

    expect(user.email, 'admin@guardian.com');
    expect(user.token, 'mock_token_123');
  });

  test('login with invalid credentials throws Exception', () async {
    expect(
      () => repository.login(email: 'wrong@mail.com', password: 'bad'),
      throwsA(isA<Exception>()),
    );
  });

  test('logout completes successfully', () async {
    await expectLater(repository.logout(), completes);
  });
}
