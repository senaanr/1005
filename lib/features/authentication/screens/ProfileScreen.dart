import 'package:app/features/authentication/screens/ProfileSettingsScreen.dart';
import 'package:flutter/material.dart';

import '../classes/profileHeader.dart';

class ProfilePage extends StatelessWidget {
  static const String path = "lib/src/pages/profile/profile8.dart";

  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: BackButton(
            color: Colors.white70,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ProfileHeader(
                avatar: NetworkImage("https://img.freepik.com/free-photo/user-profile-icon-front-side-with-white-background_187299-40010.jpg?w=826"),
                coverImage: NetworkImage("https://img.freepik.com/free-vector/futuristic-background-design_23-2148503793.jpg"),
                title: "Deneme",
                actions: <Widget>[
                  MaterialButton(
                    color: Colors.white,
                    shape: const CircleBorder(),
                    elevation: 0,
                    child: const Icon(Icons.edit),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileSettingsPage(),
                        ),
                      );
                    },
                  )
                ],
              ),
              const SizedBox(height: 10.0),
              const UserInfo(),
            ],
          ),
        ));
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
            alignment: Alignment.topLeft,
            child: const Text(
              "Bilgilerim",
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Card(
            child: Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      ...ListTile.divideTiles(
                        color: Colors.grey,
                        tiles: [
                          const ListTile(
                            leading: Icon(Icons.person),
                            title: Text("Ad Soyad"),
                            subtitle: Text(
                                "Deneme"),
                          ),
                          const ListTile(
                            leading: Icon(Icons.email),
                            title: Text("Email"),
                            subtitle: Text("deneme@gmail.com"),
                          ),
                          const ListTile(
                            leading: Icon(Icons.phone),
                            title: Text("Phone"),
                            subtitle: Text("99-99-999"),
                          ),
                          const ListTile(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 4),
                            leading: Icon(Icons.my_location),
                            title: Text("Konum"),
                            subtitle: Text("Samsun/Atakum"),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
