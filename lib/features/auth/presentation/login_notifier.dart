import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/di/injection.dart';
import '../domain/login_user.dart';
import '../domain/user.dart';

part 'login_notifier.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = _Loading;
  const factory LoginState.success(User user) = _Success;
  const factory LoginState.error(String message) = _Error;
}

class LoginNotifier extends StateNotifier<LoginState> {
  final LoginUser _loginUser;

  LoginNotifier(this._loginUser) : super(const LoginState.initial());

  Future<void> login(String email, String password) async {
    state = const LoginState.loading();
    try {
      final user = await _loginUser(email: email, password: password);
      state = LoginState.success(user);
    } catch (e) {
      state = LoginState.error(e.toString().replaceAll('Exception: ', ''));
    }
  }
}

final loginNotifierProvider = StateNotifierProvider<LoginNotifier, LoginState>((ref) {
  return LoginNotifier(getIt<LoginUser>());
});
