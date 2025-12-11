class LocationEntity {
  final double latitude;
  final double longitude;

  LocationEntity({
    required this.latitude,
    required this.longitude,
  });

  factory LocationEntity.initial() {
    return LocationEntity(
      latitude: 50.4501,
      longitude: 30.5234,
    );
  }

  LocationEntity copyWith({
    double? latitude,
    double? longitude,
  }) {
    return LocationEntity(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  @override
  bool operator ==(covariant LocationEntity other) {
    if (identical(this, other)) return true;

    return other.latitude == latitude && other.longitude == longitude;
  }

  @override
  int get hashCode => latitude.hashCode ^ longitude.hashCode;
}
