import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

class MapHomePage extends StatefulWidget {
  const MapHomePage({super.key});

  @override
  State<MapHomePage> createState() => _MapHomePageState();
}

class _MapHomePageState extends State<MapHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Map",
          style: TextStyle(fontSize: 20.sp),
        ),
      ),
      body: OpenStreetMapSearchAndPick(
          center: LatLong(23, 89), onPicked: (pickedData) {}),
    );
  }
}
