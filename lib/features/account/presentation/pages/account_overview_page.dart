import 'package:firebaseblocryze/features/account/presentation/pages/wallet_page.dart';
import 'package:firebaseblocryze/features/account/presentation/widgets/faq/faq_section.dart';
import 'package:firebaseblocryze/features/account/presentation/widgets/legal_policies/legal_policies_section.dart';
import 'package:firebaseblocryze/features/account/presentation/widgets/widgets.dart';
import 'package:firebaseblocryze/features/login/blocs/auth/auth_bloc.dart';
import 'package:firebaseblocryze/features/login/utils/login_strings.dart';
import 'package:firebaseblocryze/features/login/utils/shared_preferences.dart';
import 'package:firebaseblocryze/features/user_profile/bloc/bloc.dart';
import 'package:firebaseblocryze/features/user_profile/bloc/user_bloc.dart';
import 'package:firebaseblocryze/features/user_profile/presentation/user_profile/pages/user_profile_page.dart';
import 'package:firebaseblocryze/uikit/theme/app_themes.dart';
import 'package:firebaseblocryze/uikit/theme/bloc/theme_bloc.dart';
import 'package:firebaseblocryze/uikit/widgets/ryze_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountOverviewPage extends StatefulWidget {
  @override
  _AccountOverviewPageState createState() => _AccountOverviewPageState();
}

class _AccountOverviewPageState extends State<AccountOverviewPage> {
  bool isDarkModeSelected = sharedPrefs.isDarkModeSelected;

  @override
  Widget build(BuildContext context) {
    final _userBloc = context.read<UserBloc>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: Theme.of(context).iconTheme,
        title: Text(
          'My Account',
          style: TextStyle(color: Theme.of(context).textTheme.headline6.color),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.notifications_none),
              onPressed: () {
                Navigator.of(context).pushNamed('/notifications');
              }),
          IconButton(
              icon: Icon(Icons.chat_outlined),
              onPressed: () {
                Navigator.of(context).pushNamed('/messages');
              }),
        ],
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoadSuccess) {
            final profileImage = _userBloc.userProfile.profilePicUrl;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 100.0,
                    child: Card(
                      margin: const EdgeInsets.symmetric(vertical: 2.0),
                      elevation: 8.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Center(
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserProfilePage()),
                            );
                          },
                          title: Text(
                            '${_userBloc.userProfile.firstName} ${_userBloc.userProfile.lastName}',
                            style: TextStyle(fontSize: 18.0),
                          ),
                          leading: CircleAvatar(
                            radius: 30.0,
                            backgroundImage: profileImage != null
                                ? NetworkImage(profileImage)
                                : AssetImage(
                                    'assets/profile-avatar-placeholder.png'),
                          ),
                          trailing: Icon(
                            Icons.keyboard_arrow_right,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    margin: const EdgeInsets.symmetric(vertical: 16.0),
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(Icons.monetization_on),
                          title: Text('My Wallet'),
                          trailing: Icon(Icons.keyboard_arrow_right),
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WalletPage()),
                          ),
                        ),
                        HorizontalDivider(),
                        ListTile(
                          leading: Icon(Icons.lock_outline),
                          title: Text('Change Password'),
                          trailing: Icon(Icons.keyboard_arrow_right),
                          onTap: () => Navigator.of(context)
                              .pushNamed('/change-password'),
                        ),
                        HorizontalDivider(),
                        ListTile(
                          leading: Icon(Icons.language),
                          title: Text('Change Language'),
                          trailing: Icon(Icons.keyboard_arrow_right),
                          onTap: () => print('Language change pressed'),
                          onLongPress: () =>
                              Navigator.of(context).pushNamed('/onboarding'),
                        ),
                      ],
                    ),
                  ),
                  SectionHeader(title: 'Notification Settings'),
                  SwitchListTile(
                    activeColor: Theme.of(context).accentColor,
                    contentPadding: const EdgeInsets.all(0),
                    value: false,
                    title: Text('Receive Invites Notification'),
                    onChanged: (isChecked) {},
                  ),
                  SwitchListTile(
                    activeColor: Theme.of(context).accentColor,
                    contentPadding: const EdgeInsets.all(0),
                    value: true,
                    title: Text('Receive Responses Notification'),
                    onChanged: (isChecked) {},
                  ),
                  SectionHeader(title: 'Themes'),
                  BlocBuilder<ThemeBloc, ThemeState>(
                    builder: (context, state) {
                      return SwitchListTile(
                        activeColor: Theme.of(context).accentColor,
                        contentPadding: const EdgeInsets.all(0),
                        value:
                            state.themeData == appThemeData[AppTheme.DarkRed],
                        title: Text('Dark Mode'),
                        onChanged: (bool value) {
                          sharedPrefs.isDarkModeSelected = value;
                          value
                              ? context
                                  .read<ThemeBloc>()
                                  .add(ThemeChanged(theme: AppTheme.DarkRed))
                              : context.read<ThemeBloc>().add(
                                  ThemeChanged(theme: AppTheme.ClassicBlue));
                        },
                      );
                    },
                  ),
                  SectionHeader(title: 'Premium'),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'Currently you have no active plans.',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  FaqSection(),
                  LegalPoliciesSection(),
                  SizedBox(height: 24.0),
                  BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
                    return RyzePrimaryButton(
                      title: LoginStrings.signOutButton,
                      action: () {
                        context
                            .read<AuthBloc>()
                            .add(AuthEvent.signedOutPressed());
                        Navigator.of(context).pushReplacementNamed('/login');
                      },
                      isAffirmative: true,
                    );
                  }),
                ],
              ),
            );
          } else if (state is UserLoadInProgress) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
