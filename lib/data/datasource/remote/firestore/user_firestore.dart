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
    final docReference = _getUserDocumentReference(userModel.id);
    await docReference.set(userModel);
  }

  Future<UserModel> getUserModelById(String id) async {
    final docRef = _getUserDocumentReference(id);
    final snapshot = await docRef.get();
    print('[DEBUG] Firestore exists: ${snapshot.exists}');
    print('[DEBUG] Firestore data: ${snapshot.data()?.fullName}');
    final userModel = snapshot.data()!;
    return userModel;
  }

  Stream<List<String>> getUserFavourites(String id) {
    final docRef = _getUserDocumentReference(id);
    return docRef.snapshots().map((snapshot) {
      final data = snapshot.data();
      return data?.favouriteListingsId ?? [];
    });
  }

  Future<void> updateUserFavourites(
    String id,
    List<String> updatedFavourites,
  ) async {
    final docRef = _getUserDocumentReference(id);
    await docRef.update({'favouriteListingsId': updatedFavourites});
  }

  DocumentReference<UserModel> _getUserDocumentReference(String id) {
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
