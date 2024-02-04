import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final User? user = ModalRoute.of(context)?.settings.arguments as User?;
    return Scaffold(
      body: Center(
        child: user == null ? Text("Hoşgeldiniz") :
        ListTile(
          title: Text(user!.displayName!),
          subtitle: Text(user!.email!),
          leading: CircleAvatar(
            child: Image.network(user!.photoURL!),
          ),
        ),
        ),
      );
  }
}
