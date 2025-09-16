import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String fullName;
  final String email;
  final String password;

  UserModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.password,
  });

  UserModel copyWith({
    String? id,
    String? fullName,
    String? email,
    String? password,
  }) {
    return UserModel(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toFirestore() {
    return <String, dynamic>{
      'id': id,
      'fullName': fullName,
      'email': email,
      'password': password,
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
    );
  }
}
