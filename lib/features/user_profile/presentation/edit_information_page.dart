import 'package:firebaseblocryze/features/user_profile/bloc/bloc.dart';
import 'package:firebaseblocryze/features/user_profile/cubit/user_form_cubit.dart';
import 'package:firebaseblocryze/features/user_profile/utils/user_profile_strings.dart';
import 'package:firebaseblocryze/features/user_profile/widgets/edit_page/edit_profile_form.dart';
import 'package:firebaseblocryze/repository/user/models/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'user_profile/pages/user_profile_page.dart';

class EditInformationPage extends StatelessWidget {
  final UserProfile userProfile;

  const EditInformationPage(this.userProfile);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserProfileFormCubit(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          iconTheme: Theme.of(context).iconTheme,
          title: Text(
            UserProfileString.editProfileTitle,
            style:
                TextStyle(color: Theme.of(context).textTheme.headline6.color),
          ),
        ),
        body: BlocListener<UserBloc, UserState>(
          listener: (context, state) {
            print(state.toString());
            if (state is UserProfileEditFailure) {
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('ERROR'),
              ));
            } else if (state is UserProfileEditSuccess) {
              Scaffold.of(context).showSnackBar(SnackBar(
                duration: const Duration(milliseconds: 1500),
                content: Text('Success! Your profile was updated'),
              ));
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserProfilePage()),
              );
            }
          },
          child: EditProfileForm(userProfile),
        ),
      ),
    );
  }
}
