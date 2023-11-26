import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:japanese_restaurant_app/services/api_geo_services.dart';

class LocationController extends ChangeNotifier {
  double lat = 0.0;
  double long = 0.0;
  String erro = "";
  String road = "";
  String cityDistrict = "";
  String postcode = "";
  LocationController() {
    getPosition();
  }

  getPosition() async {
    try {
      Position position = await _currentPosition();
      lat = position.latitude;
      long = position.longitude;

      Map<String, dynamic> locationInfo =
          await ApiGeoLocation.fetchLocationInfo(lat, long);

      road = locationInfo['road'];
      cityDistrict = locationInfo['city_district'];
      postcode = locationInfo['postcode'];
    } catch (e) {
      erro = e.toString();
    }
    notifyListeners();
  }

  Future<Position> _currentPosition() async {
    LocationPermission permission;

    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }
}
