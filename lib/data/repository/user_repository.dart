import 'package:marketplace_musical_instruments_app/core/exception/user_not_found_exception.dart';
import 'package:marketplace_musical_instruments_app/core/service/camera_picker_service.dart';
import 'package:marketplace_musical_instruments_app/core/service/user_auth_service.dart';
import 'package:marketplace_musical_instruments_app/data/datasource/remote/firestore/listing_firestore.dart';
import 'package:marketplace_musical_instruments_app/data/datasource/remote/firestore/user_firestore.dart';
import 'package:marketplace_musical_instruments_app/data/datasource/remote/storage/user_storage.dart';
import 'package:marketplace_musical_instruments_app/data/model/listing_model.dart';
import 'package:marketplace_musical_instruments_app/data/model/user_model.dart';

class UserRepository {
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
    final userId = UserAuthService.userId;
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
    final userImageFile = await CameraPickerService.pickImageFileFromGallery();
    final userImageUrl = await _userStorage.saveImage(userImageFile);
    return userImageUrl;
  }

  Stream<UserModel> getUserModelCurrentData() {
    final userStream = UserAuthService.user;
    return userStream.asyncMap((user) async {
      print('[DEBUG] Firebase user: $user');
      if (user == null) throw UserNotFoundException('User didn\'t find');
      return await _userFirestore.getUserModelById(user.uid);
    });
  }

  Future<void> updateUserFavourites(List<String> updatedFavourites) async {
    final userId = UserAuthService.userId;
    await _userFirestore.updateUserFavourites(userId, updatedFavourites);
  }

  Stream<List<String>> getFavouriteListingsId() {
    final userId = UserAuthService.userId;
    return _userFirestore.getUserFavourites(userId);
  }

  Stream<List<ListingModel>> getUserFavouriteListings() async* {
    await for (final favouriteListingsId in getFavouriteListingsId()) {
      yield* _listingFirestore.getUserFavouriteListings(favouriteListingsId);
    }
  }
}
