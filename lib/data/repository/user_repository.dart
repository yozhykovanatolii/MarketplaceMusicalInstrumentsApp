import 'package:marketplace_musical_instruments_app/data/datasource/remote/user/user_firestore.dart';

class UserRepository {
  final _userFirestore = UserFirestore();

  Future<bool> checkIfUserExistByEmail(String email) async {
    return _userFirestore.checkUserByEmail(email);
  }
}
