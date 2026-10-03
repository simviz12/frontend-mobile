import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'live_location_notifier.freezed.dart';

@freezed
sealed class LiveLocationState with _$LiveLocationState {
  const factory LiveLocationState.loading() = _Loading;
  const factory LiveLocationState.active(LatLng currentPosition) = _Active;
  const factory LiveLocationState.error(String message) = _Error;
}

class LiveLocationNotifier extends StateNotifier<LiveLocationState> {
  Timer? _timer;
  final String deviceId;

  LiveLocationNotifier(this.deviceId) : super(const LiveLocationState.loading()) {
    _initTracking();
  }

  void _initTracking() {
    // Simulate initial location
    LatLng current = const LatLng(4.6097, -74.0817); // Bogota
    state = LiveLocationState.active(current);

    // Simulate WebSocket updates every 2 seconds
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      
      // Slightly move the coordinates to simulate tracking
      current = LatLng(current.latitude + 0.0001, current.longitude + 0.0001);
      state = LiveLocationState.active(current);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

final liveLocationNotifierProvider = StateNotifierProvider.family<LiveLocationNotifier, LiveLocationState, String>((ref, deviceId) {
  return LiveLocationNotifier(deviceId);
});
