import 'package:marketplace_musical_instruments_app/core/service/user_auth_service.dart';
import 'package:marketplace_musical_instruments_app/data/datasource/remote/user/user_firestore.dart';
import 'package:marketplace_musical_instruments_app/data/model/user_model.dart';

class AuthRepository {
  final _userFirestore = UserFirestore();

  Future<void> signInUser(String email, String password) async {
    await UserAuthService.signInWithEmailAndPassword(email, password);
  }

  Future<void> signUpUser(
    String email,
    String password,
    String fullName,
  ) async {
    final userID = await UserAuthService.signUpWithEmailAndPassword(
      email,
      password,
    );
    UserModel userModel = UserModel(
      id: userID,
      fullName: fullName,
      email: email,
      password: password,
      phoneNumber: '+380955040255',
      about: '',
      avatar: '',
      favouriteListingsId: [],
    );
    await _userFirestore.saveUser(userModel);
  }

  Future<void> resetPassword(String email) async {
    return await UserAuthService.resetPassword(email);
  }

  Future<void> signOut() async => UserAuthService.signOut();
}
