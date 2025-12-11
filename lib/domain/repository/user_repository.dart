import 'package:marketplace_musical_instruments_app/domain/entity/listing_entity.dart';
import 'package:marketplace_musical_instruments_app/domain/entity/user_entity.dart';

abstract interface class UserRepository {
  Future<bool> checkIfUserExistByEmail(String email);
  Future<void> updateUserData(UserEntity userEntity);
  Future<String> getUserImage();
  Stream<UserEntity> getUserModelCurrentData();
  Future<void> callUserDialer(String userPhoneNumber);
  Future<void> updateUserFavourites(List<String> updatedFavourites);
  Stream<List<String>> getFavouriteListingsId();
  Stream<List<ListingEntity>> getUserFavouriteListings();
}
