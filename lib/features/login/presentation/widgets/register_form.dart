//import 'package:flutter/material.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
//
//class RegisterForm extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return BlocConsumer(
//
//      child: Column(
//        crossAxisAlignment: CrossAxisAlignment.center,
//        children: [
//          Text('Sign In',
//          style: TextStyle(
//           fontSize: 28,
//          ),
//          textAlign: TextAlign.center),
//          Flexible(
//            child: RaisedButton(
//              onPressed: () {
//                Navigator.of(context).pushReplacementNamed('/login');
//              },
//              shape: RoundedRectangleBorder(
//                  borderRadius: BorderRadius.circular(18.0),
//                  side: BorderSide(color: Colors.black38)),
//              color: Colors.deepPurpleAccent,
//              child: Text(
//                'Sign Out',
//                style: TextStyle(color: Colors.white),
//              ),
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//}
//
//void _doRegister() {
//////      context.read<SignInFormBloc>().add(
//////        const SignInFormEvent
//////            .registerWithEmailAndPasswordPressed(),
////    //  );
////    });
//}
