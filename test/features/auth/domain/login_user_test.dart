import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:guardian_mobile/features/auth/domain/auth_repository.dart';
import 'package:guardian_mobile/features/auth/domain/login_user.dart';
import 'package:guardian_mobile/features/auth/domain/user.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late MockAuthRepository mockRepository;
  late LoginUser usecase;

  setUp(() {
    mockRepository = MockAuthRepository();
    usecase = LoginUser(mockRepository);
  });

  const tEmail = 'test@example.com';
  const tPassword = 'password123';
  final tUser = User(id: '1', email: tEmail, name: 'Test', token: 'token');

  test('should return User when repository login is successful', () async {
    // arrange
    when(() => mockRepository.login(email: tEmail, password: tPassword))
        .thenAnswer((_) async => tUser);

    // act
    final result = await usecase(email: tEmail, password: tPassword);

    // assert
    expect(result, tUser);
    verify(() => mockRepository.login(email: tEmail, password: tPassword)).called(1);
    verifyNoMoreInteractions(mockRepository);
  });

  test('should throw Exception when repository throws', () async {
    // arrange
    when(() => mockRepository.login(email: tEmail, password: tPassword))
        .thenThrow(Exception('Invalid credentials'));

    // act & assert
    expect(() => usecase(email: tEmail, password: tPassword), throwsA(isA<Exception>()));
  });
}
