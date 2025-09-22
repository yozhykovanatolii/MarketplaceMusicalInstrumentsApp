import 'package:geolocator/geolocator.dart';
import 'package:marketplace_musical_instruments_app/core/exception/geolocation_exception.dart';

class GeolocationService {
  Future<Position> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw GeolocationException('Location services are disabled.');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw const PermissionDeniedException(
          'Location permissions are denied',
        );
      }
    }
    return await Geolocator.getCurrentPosition();
  }
}
