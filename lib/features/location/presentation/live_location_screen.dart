import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_map/flutter_map.dart';
import 'live_location_notifier.dart';

class LiveLocationScreen extends ConsumerStatefulWidget {
  final String deviceId;
  const LiveLocationScreen({super.key, required this.deviceId});

  @override
  ConsumerState<LiveLocationScreen> createState() => _LiveLocationScreenState();
}

class _LiveLocationScreenState extends ConsumerState<LiveLocationScreen> {
  final MapController _mapController = MapController();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(liveLocationNotifierProvider(widget.deviceId));

    return Scaffold(
      appBar: AppBar(title: const Text('Rastreo en Tiempo Real')),
      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (msg) => Center(child: Text('Error: $msg')),
        active: (initialLocation) {
          return FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: initialLocation,
              initialZoom: 16.0,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.simviz12.guardian_mobile',
              ),
              // We use a Consumer just for the MarkerLayer so ONLY this widget rebuilds
              // when the location changes, not the whole map (TileLayer).
              Consumer(
                builder: (context, ref, child) {
                  // Select only the currentPosition from the state to prevent unnecessary rebuilds
                  final location = ref.watch(
                    liveLocationNotifierProvider(widget.deviceId).select(
                      (s) => s.maybeWhen(
                        active: (loc) => loc,
                        orElse: () => initialLocation,
                      ),
                    ),
                  );

                  // Update camera to follow location
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (mounted) {
                      _mapController.move(location, _mapController.camera.zoom);
                    }
                  });

                  return MarkerLayer(
                    markers: [
                      Marker(
                        point: location,
                        width: 50,
                        height: 50,
                        child: const Icon(
                          Icons.location_history,
                          color: Colors.blue,
                          size: 50,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
