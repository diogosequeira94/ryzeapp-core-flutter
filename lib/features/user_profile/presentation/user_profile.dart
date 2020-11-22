import 'package:firebaseblocryze/features/login_feature/blocs/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('This is the User Profile'),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 50,
            width: double.infinity,
            child: BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                return RaisedButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(
                      AuthEvent.signedOutPressed(),
                    );
                    Navigator.of(context).pushReplacementNamed('/login');
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.black38)),
                  color: Colors.deepPurpleAccent,
                  child:  Text(
                    'Sign Out',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
