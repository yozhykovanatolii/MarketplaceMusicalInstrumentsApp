import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/exception/permission_denied_exception.dart';
import 'package:marketplace_musical_instruments_app/core/exception/photo_not_selected_exception.dart';
import 'package:marketplace_musical_instruments_app/data/repository/auth_repository.dart';
import 'package:marketplace_musical_instruments_app/data/repository/user_repository.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/edit_profile/edit_profile_event.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/edit_profile/edit_profile_state.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/login/login_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  final _userRepository = UserRepository();
  final _authRepository = AuthRepository();

  EditProfileBloc() : super(EditProfileState.initial()) {
    on<ProfileAvatarChangeEvent>(_editUserAvatar);
    on<ProfileFullNameChangeEvent>(_editUserFullName);
    on<ProfileAboutChangeEvent>(_editAbout);
    on<ProfilePhoneNumberChangeEvent>(_editUserPhoneNumber);
    on<UserProfileFetchEvent>(_fetchUserProfile);
    on<ProfileUpdateEvent>(_updateProfile);
    on<ProfileLogoutEvent>(_logOut);
  }

  Future<void> _editUserAvatar(
    ProfileAvatarChangeEvent event,
    Emitter<EditProfileState> emit,
  ) async {
    try {
      final userAvatarUrl = await _userRepository.getUserImage();
      emit(state.copyWith(avatarUrl: userAvatarUrl));
    } on PermissionDeniedException catch (exception) {
      emit(state.copyWith(errorMessage: exception.errorMessage));
    } on PhotoNotSelectedException catch (exception) {
      emit(state.copyWith(errorMessage: exception.errorMessage));
    } finally {
      emit(state.copyWith(errorMessage: ''));
    }
  }

  void _editUserFullName(
    ProfileFullNameChangeEvent event,
    Emitter<EditProfileState> emit,
  ) {
    emit(state.copyWith(fullName: event.fullName));
  }

  void _editAbout(
    ProfileAboutChangeEvent event,
    Emitter<EditProfileState> emit,
  ) {
    emit(state.copyWith(about: event.about));
  }

  void _editUserPhoneNumber(
    ProfilePhoneNumberChangeEvent event,
    Emitter<EditProfileState> emit,
  ) {
    emit(state.copyWith(phoneNumber: event.phoneNumber));
  }

  void _fetchUserProfile(
    UserProfileFetchEvent event,
    Emitter<EditProfileState> emit,
  ) {
    emit(
      state.copyWith(
        fullName: event.user.fullName,
        phoneNumber: event.user.phoneNumber,
        about: event.user.about,
        avatarUrl: event.user.avatar,
      ),
    );
  }

  Future<void> _updateProfile(
    ProfileUpdateEvent event,
    Emitter<EditProfileState> emit,
  ) async {
    emit(state.copyWith(formStatus: FormStatus.loading));
    try {
      await _userRepository.updateUserData(
        state.avatarUrl,
        state.fullName,
        state.phoneNumber,
        state.about,
      );
      emit(state.copyWith(formStatus: FormStatus.success));
    } catch (exception) {
      emit(state.copyWith(errorMessage: exception.toString()));
    } finally {
      emit(
        state.copyWith(
          errorMessage: '',
          formStatus: FormStatus.initial,
        ),
      );
    }
  }

  Future<void> _logOut(
    ProfileLogoutEvent event,
    Emitter<EditProfileState> emit,
  ) async {
    await _authRepository.signOut();
  }
}
