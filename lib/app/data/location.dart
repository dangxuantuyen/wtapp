import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longtitude;
  Future<void> getLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    latitude = position.latitude;
    longtitude = position.longitude;
    print(position.latitude);
  }
}
