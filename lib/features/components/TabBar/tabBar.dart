import 'package:app/features/authentication/screens/contactScreen.dart';
import 'package:app/features/authentication/screens/diseaseInfoScreen.dart';
import 'package:app/features/authentication/screens/educational_screen.dart';
import 'package:app/features/authentication/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:app/features/authentication/screens/cameraScreen.dart';

class MyTabBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 5,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: TabBarView(
            children: [
              HomeScreen(),
              EducateScreen(),
              CameraScreen(),
              ContactScreen(),
              DiseaseInfoScreen(),
            ],
          ),
          bottomNavigationBar: ColoredBox(
            color: Colors.transparent,
            child: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home),),
                Tab(icon: Icon(Icons.video_collection)),
                Tab(icon: Icon(Icons.add_box_outlined)),
                Tab(icon: Icon(Icons.contact_emergency)),
                Tab(icon: Icon(Icons.info)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
