import 'package:marketplace_musical_instruments_app/core/validator/user_validator.dart';
import 'package:marketplace_musical_instruments_app/domain/entity/user_entity.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/login/login_state.dart';

class EditProfileState {
  final UserEntity user;
  final String errorMessage;
  final FormStatus formStatus;

  EditProfileState({
    required this.user,
    required this.errorMessage,
    required this.formStatus,
  });

  factory EditProfileState.initial() {
    return EditProfileState(
      user: UserEntity.initial(),
      errorMessage: '',
      formStatus: FormStatus.initial,
    );
  }

  EditProfileState copyWith({
    UserEntity? user,
    String? errorMessage,
    FormStatus? formStatus,
  }) {
    return EditProfileState(
      user: user ?? this.user,
      errorMessage: errorMessage ?? this.errorMessage,
      formStatus: formStatus ?? this.formStatus,
    );
  }

  String get counterAbout => '${user.about.length}/115';

  String? get fullNameError => UserValidator.validateFullName(user.fullName);

  String? get phoneNumberError =>
      UserValidator.validatePhoneNumber(user.phoneNumber);

  String? get aboutError => UserValidator.validateAboutYourself(user.about);
}
