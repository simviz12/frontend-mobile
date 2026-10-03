import 'package:injectable/injectable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

@injectable
class LinkDevice {
  final FirebaseMessaging _messaging;

  LinkDevice() : _messaging = FirebaseMessaging.instance;

  Future<void> call({required bool isProtected}) async {
    // 1. Request permissions
    await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    // 2. Get FCM token
    final token = await _messaging.getToken();
    if (token == null) throw Exception("Could not get FCM token");

    // 3. TODO: Send token to Backend (POST /devices) with the role (isProtected)
    
    // 4. Listen to token refresh
    _messaging.onTokenRefresh.listen((newToken) {
      // TODO: Send new token to Backend (PATCH /devices/:id/token)
    });
  }
}
