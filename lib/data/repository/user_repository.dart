import 'package:marketplace_musical_instruments_app/core/exception/user_not_found_exception.dart';
import 'package:marketplace_musical_instruments_app/data/datasource/local/camera/camera_picker.dart';
import 'package:marketplace_musical_instruments_app/data/datasource/remote/user/user_auth.dart';
import 'package:marketplace_musical_instruments_app/data/datasource/remote/user/user_firestore.dart';
import 'package:marketplace_musical_instruments_app/data/datasource/remote/user/user_storage.dart';
import 'package:marketplace_musical_instruments_app/data/model/user_model.dart';

class UserRepository {
  final _cameraPicker = CameraPicker();
  final _userAuth = UserAuth();
  final _userStorage = UserStorage();
  final _userFirestore = UserFirestore();

  Future<bool> checkIfUserExistByEmail(String email) async {
    return _userFirestore.checkUserByEmail(email);
  }

  Future<String> getUserImage() async {
    final userImageFile = await _cameraPicker.pickImageFileFromGallery();
    final userImageUrl = await _userStorage.saveUserImage(userImageFile);
    return userImageUrl;
  }

  Stream<UserModel> getUserModelCurrentData() {
    final userStream = _userAuth.user;
    return userStream.asyncMap((user) async {
      print('[DEBUG] Firebase user: $user');
      if (user == null) throw UserNotFoundException('User didn\'t find');
      return await _userFirestore.getUserModelById(user.uid);
    });
  }
}
