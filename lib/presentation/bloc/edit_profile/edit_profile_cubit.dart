import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/exception/permission_denied_exception.dart';
import 'package:marketplace_musical_instruments_app/core/exception/photo_not_selected_exception.dart';
import 'package:marketplace_musical_instruments_app/core/exception/auth/user_not_found_exception.dart';
import 'package:marketplace_musical_instruments_app/domain/entity/user_entity.dart';
import 'package:marketplace_musical_instruments_app/domain/repository/auth_repository.dart';
import 'package:marketplace_musical_instruments_app/domain/repository/user_repository.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/edit_profile/edit_profile_state.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/login/login_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  final UserRepository userRepository;
  final AuthRepository authRepository;

  EditProfileCubit(
    this.userRepository,
    this.authRepository,
  ) : super(EditProfileState.initial());

  Future<void> editUserAvatar() async {
    try {
      final userAvatarUrl = await userRepository.getUserImage();
      final user = state.user;
      emit(state.copyWith(user: user.copyWith(avatar: userAvatarUrl)));
    } on PermissionDeniedException catch (exception) {
      emit(state.copyWith(errorMessage: exception.errorMessage));
    } on PhotoNotSelectedException catch (exception) {
      emit(state.copyWith(errorMessage: exception.errorMessage));
    } finally {
      emit(state.copyWith(errorMessage: ''));
    }
  }

  void editUserFullName(String fullName) {
    final user = state.user;
    emit(
      state.copyWith(
        user: user.copyWith(fullName: fullName),
      ),
    );
  }

  void editAbout(String about) {
    final user = state.user;
    emit(
      state.copyWith(
        user: user.copyWith(about: about),
      ),
    );
  }

  void editUserPhoneNumber(String phoneNumber) {
    final user = state.user;
    emit(
      state.copyWith(
        user: user.copyWith(phoneNumber: phoneNumber),
      ),
    );
  }

  void fetchUserProfile(UserEntity user) {
    emit(state.copyWith(user: user));
  }

  Future<void> updateProfile() async {
    emit(state.copyWith(formStatus: FormStatus.loading));
    try {
      await userRepository.updateUserData(state.user);
      emit(state.copyWith(formStatus: FormStatus.success));
    } on UserNotFoundException catch (exception) {
      emit(
        state.copyWith(
          errorMessage: exception.errorMessage,
        ),
      );
    } finally {
      emit(
        state.copyWith(
          errorMessage: '',
          formStatus: FormStatus.initial,
        ),
      );
    }
  }

  Future<void> logOut() async {
    await authRepository.signOut();
  }
}
