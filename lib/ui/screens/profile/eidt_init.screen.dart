import 'package:flutter/material.dart';
import 'package:uni_dating_app/repositories/users/users.repository.dart';
import 'package:uni_dating_app/ui/screens/profile/edit_profile.bloc.dart';
import 'package:uni_dating_app/ui/screens/profile/profile.edit.dart';
import 'package:uni_dating_app/utils/bloc.dart';

class EditInitScreen extends StatelessWidget {
  const EditInitScreen({Key? key}) : super(key: key);

  static const String routeName = '/edit_profile';

  static void navigate(BuildContext context) {
    Navigator.of(context).pushNamed(routeName);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      blocBuilder: () {
        return EditProfileBloc(
          UsersRepository.of(context),
        );
      },
      builder: (context, bloc) {
        return const ProfileEditScreen();
      },
    );
  }
}
