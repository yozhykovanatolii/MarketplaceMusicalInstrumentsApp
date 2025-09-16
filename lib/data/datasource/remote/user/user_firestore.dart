import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:marketplace_musical_instruments_app/data/model/user_model.dart';

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

  Future<void> saveUser(UserModel userModel) async {
    final docReference = getUserDocumentReference(userModel.id);
    await docReference.set(userModel);
  }

  DocumentReference<UserModel> getUserDocumentReference(String id) {
    return _firestore
        .collection('users')
        .doc(id)
        .withConverter(
          fromFirestore: UserModel.fromFirestore,
          toFirestore: (UserModel userModel, options) =>
              userModel.toFirestore(),
        );
  }
}
