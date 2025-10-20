import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/app/app_bloc.dart';
import 'package:marketplace_musical_instruments_app/presentation/bloc/app/app_state.dart';

class UserFullNameSection extends StatelessWidget {
  const UserFullNameSection({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppBloc>().state;
    final userFullName = state is UserAuthenticatedState
        ? state.userModel.fullName
        : 'Uknown';
    return Text(
      userFullName,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
