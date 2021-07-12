import 'package:firebaseblocryze/features/account/presentation/widgets/section_header_widget.dart';
import 'package:firebaseblocryze/features/login/utils/shared_preferences.dart';
import 'package:firebaseblocryze/platform/cubit/user_settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserSettingsCubit(),
      child: BlocBuilder<UserSettingsCubit, UserSettingsState>(
          builder: (context, state) {
        return Column(
          children: [
            SectionHeader(title: 'Notification Settings'),
            SwitchListTile(
              activeColor: Theme.of(context).accentColor,
              contentPadding: const EdgeInsets.all(0),
              value: sharedPrefs.isReceiveInviteNotifications,
              title: Text('Receive Invites Notification'),
              onChanged: (isChecked) {
                context
                    .read<UserSettingsCubit>()
                    .receiveInvitesChanged(isChecked);
              },
            ),
            SwitchListTile(
              activeColor: Theme.of(context).accentColor,
              contentPadding: const EdgeInsets.all(0),
              value: sharedPrefs.isReceiveResponsesNotifications,
              title: Text('Receive Responses Notification'),
              onChanged: (isChecked) {
                context
                    .read<UserSettingsCubit>()
                    .receiveResponsesChanged(isChecked);
              },
            ),
          ],
        );
      }),
    );
  }
}
