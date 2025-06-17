import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';

class Mapa extends StatelessWidget {
  const Mapa({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: FlutterMap(
        options: const MapOptions(
          initialCenter: LatLng(-22.8204, -47.2732),
          initialZoom: 13.0,
        ),
        children: [
          TileLayer(
            urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
            userAgentPackageName: "com.example",
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: LatLng(-22.8203, -47.2729),
                width: 80,
                height: 80,
                child: Icon(
                  Icons.location_pin,
                  size: 40,
                  color: Colors.brown,
                ),
              ),
              Marker(
                point: LatLng(-22.8201, -47.2758),
                width: 80,
                height: 80,
                child: Icon(
                  Icons.location_pin,
                  size: 40,
                  color: Colors.brown,
                ),
              ),
              Marker(
                point: LatLng(-22.8195, -47.2735),
                width: 80,
                height: 80,
                child: Icon(
                  Icons.location_pin,
                  size: 40,
                  color: Colors.brown,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
