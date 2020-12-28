import 'package:firebaseblocryze/features/login_feature/blocs/auth/auth_bloc.dart';
import 'package:firebaseblocryze/features/login_feature/utils/login_strings.dart';
import 'package:firebaseblocryze/features/settings/presentation/pages/wallet_page.dart';
import 'package:firebaseblocryze/features/settings/presentation/widgets/horizontal_divider_widget.dart';
import 'package:firebaseblocryze/features/settings/presentation/widgets/section_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsOverviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            elevation: 8.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: ListTile(
              onTap: () => print('Open profile pressed'),
              title: Text('Diogo Sequeira'),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://cdn.psychologytoday.com/sites/default/files/styles/image-article_inline_full/public/field_blog_entry_images/2018-09/shutterstock_648907024.jpg?itok=ji6Xj8tv'),
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
    );
  }
}
