import 'package:app/features/authentication/screens/ProfileScreen.dart';
import 'package:app/features/authentication/screens/SettingsScreen.dart';
import 'package:app/features/authentication/screens/educational_screen.dart';
import 'package:app/features/authentication/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:app/features/authentication/screens/cameraScreen.dart';

class MyTabBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: TabBarView(
            children: [
              HomeScreen(),
              EducateScreen(),
              CameraScreen(),
              SettingsScreen(),
            ],
          ),
          bottomNavigationBar: ColoredBox(
            color: Colors.transparent,
            child: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home),),
                Tab(icon: Icon(Icons.video_collection)),
                Tab(icon: Icon(Icons.add_box_outlined)),
                Tab(icon: Icon(Icons.account_box)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
