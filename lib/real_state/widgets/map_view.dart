import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:my_widgets/my_widgets.dart';
import 'package:my_widgets/real_state/widgets/publisher_real_state_details_page.dart';

class ViewMap extends StatelessWidget {
  const ViewMap({
    super.key,
    required this.latitude,
    required this.longitude,

  });

  final latitude;
  final longitude;

  @override
  Widget build(BuildContext context) {
    return EScaffold(
      appBar: AppBar(
          title: const TitleText("Géolocalisation",
              )),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(
              latitude,
             longitude),
          initialZoom: 12.2,
        ),
        children: [
          TileLayer(
            urlTemplate:
                'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName:
                'com.example.app',
          ),
          MarkerLayer(
            markers: [
              marker(
                LatLng(
                 latitude,
                  longitude),
              )
            ],
          )
        ],
      ),
    );
  }
}
