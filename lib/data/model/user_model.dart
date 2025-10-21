import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String fullName;
  final String email;
  final String password;
  final String about;
  final String phoneNumber;
  final String avatar;
  final List<String> favouriteListings;

  UserModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.password,
    required this.about,
    required this.phoneNumber,
    required this.avatar,
    required this.favouriteListings,
  });

  UserModel copyWith({
    String? id,
    String? fullName,
    String? email,
    String? password,
    String? about,
    String? phoneNumber,
    String? avatar,
    List<String>? favouriteListings,
  }) {
    return UserModel(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      password: password ?? this.password,
      about: about ?? this.about,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      avatar: avatar ?? this.avatar,
      favouriteListings: favouriteListings ?? this.favouriteListings,
    );
  }

  Map<String, dynamic> toFirestore() {
    return <String, dynamic>{
      'id': id,
      'fullName': fullName,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'about': about,
      'avatar': avatar,
      'favouriteListings': favouriteListings,
    };
  }

  factory UserModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return UserModel(
      id: data?['id'] as String,
      fullName: data?['fullName'] as String,
      email: data?['email'] as String,
      password: data?['password'] as String,
      phoneNumber: data?['phoneNumber'] as String,
      about: data?['about'] as String,
      avatar: data?['avatar'] as String,
      favouriteListings:
          (data?['favouriteListings'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );
  }
}
