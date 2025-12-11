abstract interface class GeolocationRepository {
  Future<Map<String, double>> getCurrentLocation();
}
