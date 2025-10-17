import 'package:marketplace_musical_instruments_app/data/datasource/remote/user/user_auth.dart';
import 'package:marketplace_musical_instruments_app/data/datasource/remote/user/user_firestore.dart';
import 'package:marketplace_musical_instruments_app/data/model/user_model.dart';

class AuthRepository {
  final _userAuth = UserAuth();
  final _userFirestore = UserFirestore();

  Future<void> signInUser(String email, String password) async {
    await _userAuth.signInWithEmailAndPassword(email, password);
  }

  Future<void> signUpUser(
    String email,
    String password,
    String fullName,
  ) async {
    final userID = await _userAuth.signUpWithEmailAndPassword(email, password);
    UserModel userModel = UserModel(
      id: userID,
      fullName: fullName,
      email: email,
      password: password,
      phoneNumber: '+380955040255',
      about: '',
      avatar: '',
    );
    await _userFirestore.saveUser(userModel);
  }
}
