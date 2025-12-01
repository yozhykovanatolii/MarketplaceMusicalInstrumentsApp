import 'package:marketplace_musical_instruments_app/core/service/geolocation_service.dart';

class GeolocationRepository {
  Future<Map<String, double>> getCurrentLocation() async {
    final position = await GeolocationService.getCurrentLocation();
    return {
      'latitude': position.latitude,
      'longitude': position.longitude,
    };
  }
}
