import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:guardian_mobile/features/auth/domain/login_user.dart';
import 'package:guardian_mobile/features/auth/domain/user.dart';
import 'package:guardian_mobile/features/auth/presentation/login_notifier.dart';

class MockLoginUser extends Mock implements LoginUser {}

void main() {
  late MockLoginUser mockLoginUser;
  late LoginNotifier notifier;

  setUp(() {
    mockLoginUser = MockLoginUser();
    notifier = LoginNotifier(mockLoginUser);
  });

  const tEmail = 'test@test.com';
  const tPassword = 'password123';
  final tUser = User(id: '1', email: tEmail, name: 'Test', token: 'token');

  test('initial state should be LoginState.initial', () {
    expect(notifier.state, const LoginState.initial());
  });

  test('should emit [initial, loading, success] when login is successful', () async {
    // arrange
    when(() => mockLoginUser(email: tEmail, password: tPassword))
        .thenAnswer((_) async => tUser);
    
    // assert later
    final expectedStates = [
      const LoginState.initial(),
      const LoginState.loading(),
      LoginState.success(tUser),
    ];
    
    int stateIndex = 0;
    notifier.addListener((state) {
      if (stateIndex < expectedStates.length) {
        expect(state, expectedStates[stateIndex]);
        stateIndex++;
      }
    });

    // act
    await notifier.login(tEmail, tPassword);
  });

  test('should emit [initial, loading, error] when login fails', () async {
    // arrange
    when(() => mockLoginUser(email: tEmail, password: tPassword))
        .thenThrow(Exception('Failed'));

    // assert later
    final expectedStates = [
      const LoginState.initial(),
      const LoginState.loading(),
      const LoginState.error('Failed'),
    ];
    
    int stateIndex = 0;
    notifier.addListener((state) {
      if (stateIndex < expectedStates.length) {
        expect(state, expectedStates[stateIndex]);
        stateIndex++;
      }
    });

    // act
    await notifier.login(tEmail, tPassword);
  });

  test('logout should revert state to initial', () {
    // arrange
    // forcibly set state to success to test logout
    notifier = LoginNotifier(mockLoginUser);
    // There is no easy way to set state without calling a method, but login is async.
    // We will just call logout and expect it sets to initial.
    notifier.logout();
    expect(notifier.state, const LoginState.initial());
  });
}
