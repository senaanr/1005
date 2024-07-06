import 'package:app/features/authentication/screens/pestsScreen.dart';
import 'package:app/features/authentication/screens/weedsScreen.dart';
import 'package:flutter/material.dart';

import 'diseasesScreen.dart';

class DiseaseInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Hastalık Bilgileri"),
          centerTitle: true,
          elevation: 0,
          bottom: TabBar(
            tabs: [
              Tab(text: 'Hastalıklar'),
              Tab(text: 'Zararlılar'),
              Tab(text: 'Yabancılar'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            DiseasesScreen(),
            PestsScreen(),
            WeedsScreen(),
          ],
        ),
      ),
    );
  }
}


