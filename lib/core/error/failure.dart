class Failure {
  final String message;
  final String? code;

  const Failure({required this.message, this.code});

  @override
  String toString() => message;
}

class NetworkFailure extends Failure {
  const NetworkFailure(String message) : super(message: message, code: 'NETWORK_ERROR');
}

class ServerFailure extends Failure {
  const ServerFailure(String message) : super(message: message, code: 'SERVER_ERROR');
}

class AuthFailure extends Failure {
  const AuthFailure(String message) : super(message: message, code: 'UNAUTHORIZED');
}
