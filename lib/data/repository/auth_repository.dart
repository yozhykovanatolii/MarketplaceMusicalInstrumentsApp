import 'package:marketplace_musical_instruments_app/data/datasource/remote/user/user_auth.dart';

class AuthRepository {
  final _userAuth = UserAuth();

  Future<void> signInUser(String email, String password) async {
    await _userAuth.signInWithEmailAndPassword(email, password);
  }
}
