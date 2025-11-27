import 'package:marketplace_musical_instruments_app/data/model/user_model.dart';
import 'package:marketplace_musical_instruments_app/domain/entity/user_entity.dart';

class UserMapper {
  static UserEntity toEntity(UserModel userModel) {
    return UserEntity(
      id: userModel.id,
      fullName: userModel.fullName,
      about: userModel.about,
      phoneNumber: userModel.phoneNumber,
      avatar: userModel.avatar,
      favouriteListingsId: userModel.favouriteListingsId,
    );
  }
}
