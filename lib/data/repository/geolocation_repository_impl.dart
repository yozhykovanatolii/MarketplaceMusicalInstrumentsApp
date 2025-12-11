import 'package:marketplace_musical_instruments_app/data/service/geolocation_service.dart';
import 'package:marketplace_musical_instruments_app/domain/repository/geolocation_repository.dart';

class GeolocationRepositoryImpl implements GeolocationRepository {
  @override
  Future<Map<String, double>> getCurrentLocation() async {
    final position = await GeolocationService.getCurrentLocation();
    return {
      'latitude': position.latitude,
      'longitude': position.longitude,
    };
  }
}
