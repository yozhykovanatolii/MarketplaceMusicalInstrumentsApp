import 'package:marketplace_musical_instruments_app/data/datasource/remote/firebase_auth/user_auth.dart';
import 'package:marketplace_musical_instruments_app/data/datasource/remote/firestore/user_firestore.dart';
import 'package:marketplace_musical_instruments_app/data/model/user_model.dart';

class AuthRepository {
  final _userFirestore = UserFirestore();
  final _userAuth = UserAuth();

  Future<void> signInUser(String email, String password) async {
    await _userAuth.signInWithEmailAndPassword(email, password);
  }

  Future<void> signUpUser(
    String email,
    String password,
    String fullName,
    String phoneNumber,
  ) async {
    final userID = await _userAuth.signUpWithEmailAndPassword(
      email,
      password,
    );
    UserModel userModel = UserModel(
      id: userID,
      fullName: fullName,
      email: email,
      password: password,
      phoneNumber: phoneNumber,
      about: '',
      avatar:
          'https://xwgraskemxbhjtgqrjxn.supabase.co/storage/v1/object/public/images/uploads/1758373217886',
      favouriteListingsId: [],
    );
    await _userFirestore.saveUser(userModel);
  }

  Future<void> resetPassword(String email) async {
    return await _userAuth.resetPassword(email);
  }

  Future<void> signOut() async => _userAuth.signOut();
}
