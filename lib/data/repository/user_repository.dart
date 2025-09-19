import 'package:marketplace_musical_instruments_app/data/datasource/remote/user/user_auth.dart';
import 'package:marketplace_musical_instruments_app/data/datasource/remote/user/user_firestore.dart';
import 'package:marketplace_musical_instruments_app/data/model/user_model.dart';

class UserRepository {
  final _userAuth = UserAuth();
  final _userFirestore = UserFirestore();

  Future<bool> checkIfUserExistByEmail(String email) async {
    return _userFirestore.checkUserByEmail(email);
  }

  Stream<UserModel> getUserModelById() {
    final userStream = _userAuth.user;
    return userStream.asyncMap((user) async {
      print('[DEBUG] Firebase user: $user');
      if (user == null) throw Exception('User didn\'t find');
      return await _userFirestore.getUserModelById(user.uid);
    });
  }
}
