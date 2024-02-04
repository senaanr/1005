import 'package:app/features/authentication/classes/user.dart';
import 'package:app/features/authentication/helpers/auth_helper.dart';
import 'package:app/features/authentication/screens/home_screen.dart';
import 'package:app/features/authentication/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Redirect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _authenticationService =
    Provider.of<AuthenticationHelper>(context, listen: false);

    return StreamBuilder(
      stream: _authenticationService.authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasData) {
          MyUser? activeUser = snapshot.data as MyUser?;
          _authenticationService.activeUserId = activeUser?.id;
          return HomeScreen();
        } else {
          return LoginScreen();
        }
      },
    );
  }
}
