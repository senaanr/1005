import 'package:app/features/authentication/screens/ProfileScreen.dart';
import 'package:app/features/authentication/screens/ProfileSettingsScreen.dart';
import 'package:app/features/authentication/screens/home_screen.dart';
import 'package:app/features/components/TabBar/tabBar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'features/authentication/screens/login_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyTabBar(),
    );
  }
}
