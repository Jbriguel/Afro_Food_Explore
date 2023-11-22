import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MiniMapCard extends StatelessWidget {
  const MiniMapCard({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(zoom: 15, center: LatLng(6.145332, 1.243344)),
      children: [
        // Layer that adds the map
        TileLayer(
          urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
          userAgentPackageName: 'dev.fleaflet.flutter_map.example',
        ),
        // Layer that adds points the map
        MarkerLayer(
          markers: [
            // First Marker
            Marker(
              point: LatLng(6.145332, 1.243344),
              width: 80,
              height: 80,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.location_on),
                color: Colors.green,
                iconSize: 45,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
