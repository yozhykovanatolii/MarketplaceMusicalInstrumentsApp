class UserEntity {
  final String id;
  final String fullName;
  final String about;
  final String phoneNumber;
  final String avatar;
  final List<String> favouriteListingsId;

  UserEntity({
    required this.id,
    required this.fullName,
    required this.about,
    required this.phoneNumber,
    required this.avatar,
    required this.favouriteListingsId,
  });

  factory UserEntity.initial() {
    return UserEntity(
      id: '',
      fullName: '',
      about: '',
      phoneNumber: '',
      avatar: '',
      favouriteListingsId: [],
    );
  }

  UserEntity copyWith({
    String? id,
    String? fullName,
    String? about,
    String? phoneNumber,
    String? avatar,
    List<String>? favouriteListingsId,
  }) {
    return UserEntity(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      about: about ?? this.about,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      avatar: avatar ?? this.avatar,
      favouriteListingsId: favouriteListingsId ?? this.favouriteListingsId,
    );
  }
}
