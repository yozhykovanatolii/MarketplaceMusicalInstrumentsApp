import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/core/exception/permission_denied_exception.dart';
import 'package:marketplace_musical_instruments_app/core/exception/photo_not_selected_exception.dart';
import 'package:marketplace_musical_instruments_app/data/repository/user_repository.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/edit_profile/edit_profile_event.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/edit_profile/edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  final _userRepository = UserRepository();

  EditProfileBloc() : super(EditProfileState.initial()) {
    on<ProfileAvatarChangeEvent>(_editUserAvatar);
    on<ProfileFullNameChangeEvent>(_editUserFullName);
    on<ProfileAboutChangeEvent>(_editAbout);
    on<ProfilePhoneNumberChangeEvent>(_editUserPhoneNumber);
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
}
