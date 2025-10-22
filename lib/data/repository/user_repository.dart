import 'package:marketplace_musical_instruments_app/core/exception/user_not_found_exception.dart';
import 'package:marketplace_musical_instruments_app/data/datasource/local/camera/camera_picker.dart';
import 'package:marketplace_musical_instruments_app/data/datasource/remote/listing/listing_firestore.dart';
import 'package:marketplace_musical_instruments_app/data/datasource/remote/user/user_auth.dart';
import 'package:marketplace_musical_instruments_app/data/datasource/remote/user/user_firestore.dart';
import 'package:marketplace_musical_instruments_app/data/datasource/remote/user/user_storage.dart';
import 'package:marketplace_musical_instruments_app/data/model/listing_model.dart';
import 'package:marketplace_musical_instruments_app/data/model/user_model.dart';

class UserRepository {
  final _cameraPicker = CameraPicker();
  final _userAuth = UserAuth();
  final _userStorage = UserStorage();
  final _userFirestore = UserFirestore();
  final _listingFirestore = ListingFirestore();

  Future<bool> checkIfUserExistByEmail(String email) async {
    return _userFirestore.checkUserByEmail(email);
  }

  Future<void> updateUserData(
    String avatarUrl,
    String fullName,
    String phoneNumber,
    String about,
  ) async {
    final userId = _userAuth.userId;
    UserModel user = await _userFirestore.getUserModelById(userId);
    user = user.copyWith(
      id: user.id,
      email: user.email,
      password: user.password,
      fullName: fullName,
      phoneNumber: phoneNumber,
      about: about,
      avatar: avatarUrl,
    );
    await _userFirestore.saveUser(user);
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

  Future<void> updateUserFavourites(List<String> updatedFavourites) async {
    final userId = _userAuth.userId;
    await _userFirestore.updateUserFavourites(userId, updatedFavourites);
  }

  Stream<List<String>> getFavouriteListingsId() {
    final userId = _userAuth.userId;
    return _userFirestore.getUserFavourites(userId);
  }

  Stream<List<ListingModel>> getUserFavouriteListings() async* {
    await for (final favouriteListingsId in getFavouriteListingsId()) {
      yield* _listingFirestore.getUserFavouriteListings(favouriteListingsId);
    }
  }
}
