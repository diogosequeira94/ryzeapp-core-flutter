import 'package:firebaseblocryze/features/login/utils/shared_preferences.dart';
import 'package:firebaseblocryze/platform/cubit/user_settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HideUnsuccessfulSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserSettingsCubit(),
      child: BlocBuilder<UserSettingsCubit, UserSettingsState>(
          builder: (context, state) {
        return SwitchListTile(
          activeColor: Theme.of(context).accentColor,
          contentPadding: const EdgeInsets.fromLTRB(12.0, 4.0, 12.0, 0.0),
          value: sharedPrefs.shouldHideUnsuccessfulApps,
          title: Text('Hide unsuccessful applications'),
          onChanged: (isChecked) {
            context
                .read<UserSettingsCubit>()
                .shouldHideNotificationsChanged(isChecked);
          },
        );
      }),
    );
  }
}
