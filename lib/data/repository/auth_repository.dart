import 'package:marketplace_musical_instruments_app/core/service/user_auth_service.dart';
import 'package:marketplace_musical_instruments_app/data/datasource/remote/firestore/user_firestore.dart';
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
    String phoneNumber,
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
      phoneNumber: phoneNumber,
      about: '',
      avatar:
          'https://xwgraskemxbhjtgqrjxn.supabase.co/storage/v1/object/public/images/uploads/1758373217886',
      favouriteListingsId: [],
    );
    await _userFirestore.saveUser(userModel);
  }

  Future<void> resetPassword(String email) async {
    return await UserAuthService.resetPassword(email);
  }

  Future<void> signOut() async => UserAuthService.signOut();
}
