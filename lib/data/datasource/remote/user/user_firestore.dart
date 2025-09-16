import 'package:cloud_firestore/cloud_firestore.dart';

class UserFirestore {
  final _firestore = FirebaseFirestore.instance;

  Future<bool> checkUserByEmail(String email) async {
    final querySnapshot = await _firestore
        .collection('users')
        .where('email', isEqualTo: email)
        .limit(1)
        .get();
    return querySnapshot.docs.isNotEmpty;
  }
}
