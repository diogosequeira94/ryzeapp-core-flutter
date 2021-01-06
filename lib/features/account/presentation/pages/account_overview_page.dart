import 'package:firebaseblocryze/features/account/presentation/pages/wallet_page.dart';
import 'package:firebaseblocryze/features/account/presentation/widgets/horizontal_divider_widget.dart';
import 'package:firebaseblocryze/features/account/presentation/widgets/section_header_widget.dart';
import 'package:firebaseblocryze/features/login/blocs/auth/auth_bloc.dart';
import 'package:firebaseblocryze/features/login/utils/login_strings.dart';
import 'package:firebaseblocryze/features/user_profile/presentation/user_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountOverviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'RyzeApp',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(icon: Icon(Icons.notifications_none), onPressed: () {
            Navigator.of(context).pushNamed('/notifications');
          }),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserProfilePage()),
                  );
                },
                title: Text('Walter White'),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://i.insider.com/5dade9bc045a3139e8686c33?width=1136&format=jpeg'),
                ),
                trailing: Icon(Icons.edit),
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
                      MaterialPageRoute(builder: (context) => WalletPage()),
                    ),
                  ),
                  HorizontalDivider(),
                  ListTile(
                    leading: Icon(Icons.lock_outline),
                    title: Text('Change Password'),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () => print('Password change pressed'),
                  ),
                  HorizontalDivider(),
                  ListTile(
                    leading: Icon(Icons.language),
                    title: Text('Change Language'),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () => print('Language change pressed'),
                    onLongPress: () => Navigator.of(context).pushNamed('/onboarding'),
                  ),
                ],
              ),
            ),
            SectionHeader(title: 'Notification Settings'),
            SwitchListTile(
              activeColor: Colors.blueAccent,
              contentPadding: const EdgeInsets.all(0),
              value: true,
              title: Text('Receive Notifications'),
              onChanged: (isChecked) {},
            ),
            SwitchListTile(
              activeColor: Colors.blueAccent,
              contentPadding: const EdgeInsets.all(0),
              value: false,
              title: Text('Receive Newsletter'),
              onChanged: (isChecked) {},
            ),
            SwitchListTile(
              activeColor: Colors.blueAccent,
              contentPadding: const EdgeInsets.all(0),
              value: false,
              title: Text('Receive Offers Notification'),
              onChanged: (isChecked) {},
            ),
            SwitchListTile(
              activeColor: Colors.blueAccent,
              contentPadding: const EdgeInsets.all(0),
              value: true,
              title: Text('Receive Responses Notification'),
              onChanged: (isChecked) {},
            ),
            SectionHeader(title: 'Premium'),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text('Currently you have no active plans.', style: TextStyle(
                fontSize: 16.0
              ),),
            ),
            SizedBox(height: 24.0),
            BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
              return InkWell(
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF3229bf),
                          Color(0xFF4568ff),
                        ],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(50.0))),
                  child: Center(
                    child: const Text(
                      LoginStrings.signOutButton,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                onTap: () {
                  context.read<AuthBloc>().add(
                        AuthEvent.signedOutPressed(),
                      );
                  Navigator.of(context).pushReplacementNamed('/login');
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
