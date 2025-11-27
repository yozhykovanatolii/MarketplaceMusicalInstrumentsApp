import 'package:marketplace_musical_instruments_app/core/exception/auth/user_not_found_exception.dart';
import 'package:marketplace_musical_instruments_app/core/service/camera_picker_service.dart';
import 'package:marketplace_musical_instruments_app/core/service/user_auth_service.dart';
import 'package:marketplace_musical_instruments_app/data/datasource/remote/firestore/listing_firestore.dart';
import 'package:marketplace_musical_instruments_app/data/datasource/remote/firestore/user_firestore.dart';
import 'package:marketplace_musical_instruments_app/data/datasource/remote/storage/supabase_storage.dart';
import 'package:marketplace_musical_instruments_app/data/mapper/user_mapper.dart';
import 'package:marketplace_musical_instruments_app/data/model/listing_model.dart';
import 'package:marketplace_musical_instruments_app/data/model/user_model.dart';
import 'package:marketplace_musical_instruments_app/domain/entity/user_entity.dart';

class UserRepository {
  final _supabaseStorage = SupabaseStorage();
  final _userFirestore = UserFirestore();
  final _listingFirestore = ListingFirestore();

  Future<bool> checkIfUserExistByEmail(String email) async {
    return _userFirestore.checkUserByEmail(email);
  }

  Future<void> updateUserData(UserEntity userEntity) async {
    UserModel user = await _userFirestore.getUserModelById(userEntity.id);
    user = user.copyWith(
      id: user.id,
      email: user.email,
      password: user.password,
      fullName: userEntity.fullName,
      phoneNumber: userEntity.phoneNumber,
      about: userEntity.about,
      avatar: userEntity.avatar,
    );
    await _userFirestore.saveUser(user);
  }

  Future<String> getUserImage() async {
    final userImageFile = await CameraPickerService.pickImageFileFromGallery();
    final userImageUrl = await _supabaseStorage.saveImage(
      userImageFile,
      'users',
    );
    return userImageUrl;
  }

  Stream<UserEntity> getUserModelCurrentData() {
    final userStream = UserAuthService.user;
    return userStream.asyncMap((user) async {
      print('[DEBUG] Firebase user: $user');
      if (user == null) throw UserNotFoundException('User didn\'t find');
      final userModel = await _userFirestore.getUserModelById(user.uid);
      return UserMapper.toEntity(userModel);
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
