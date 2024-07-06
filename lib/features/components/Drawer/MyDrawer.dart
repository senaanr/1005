import 'package:app/features/authentication/screens/home_screen.dart';
import 'package:flutter/material.dart';

import '../../authentication/screens/ProfileScreen.dart';

class MyDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  bool isSwitched = false;
  String selectedLanguage = 'Türkçe'; // Varsayılan dil Türkçe olarak ayarlandı

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Sena Nur"),
            accountEmail: Text("senanur-eren-102@hotmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                "https://img.freepik.com/free-photo/user-profile-icon-front-side-with-white-background_187299-40010.jpg?w=826",
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.green,
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_box_outlined),
            title: Text('Hesabım'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(),
                ),
              );
            },
          ),
          ExpansionTile(
            leading: Icon(Icons.language),
            title: Text('Dil Tercihi'),
            trailing: Icon(Icons.arrow_drop_down),
            children: <Widget>[
              ListTile(
                title: Text('Türkçe'),
                onTap: () {
                  setState(() {
                    selectedLanguage = 'Türkçe';
                  });
                  Navigator.pop(context); // Diyalog penceresini kapat
                },
              ),
              ListTile(
                title: Text('English'),
                onTap: () {
                  setState(() {
                    selectedLanguage = 'English';
                  });
                  Navigator.pop(context); // Diyalog penceresini kapat
                },
              ),
              // Diğer dil seçenekleri buraya eklenebilir
            ],
          ),
          ListTile(
            leading: Icon(Icons.lightbulb),
            title: Text('Uygulama Teması'),
            trailing: Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                });
              },
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.notifications_active_outlined),
            title: Text('Bildirimler'),
            trailing: Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                });
              },
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.message_outlined),
            title: Text('İletişim'),
            trailing: Icon(Icons.arrow_right),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app_outlined),
            title: Text(
              'Çıkış Yap',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
            trailing: Icon(Icons.arrow_right),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
