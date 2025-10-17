import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/edit_profile/edit_profile_event.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/edit_profile/edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  EditProfileBloc() : super(EditProfileState.initial()) {
    on<ProfileFullNameChangeEvent>(_editUserFullName);
    on<ProfileAboutChangeEvent>(_editAbout);
    on<ProfilePhoneNumberChangeEvent>(_editUserPhoneNumber);
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
