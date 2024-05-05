import 'package:app/features/authentication/screens/ProfileScreen.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white70,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(32.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 30.0),
            Row(
              children: <Widget>[
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white38,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://img.freepik.com/free-photo/user-profile-icon-front-side-with-white-background_187299-40010.jpg?w=826"),
                      fit: BoxFit.cover,
                    ),
                    border: Border.all(
                      color: Colors.black87,
                      width: 1.0,
                    ),
                  ),
                ),
                SizedBox(width: 20.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Deneme",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      Text(
                        "Ex",
                        style: TextStyle(
                          //color: Colors.grey.shade400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            ListTile(
              title: Text(
                "Hesabım",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(),
                  ),
                );
              },
            ),
            Divider(),
            ListTile(
              title: Text(
                "Dil Tercihi",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                "Türkçe",
                //style: TextStyle(color: ),
              ),
              trailing: Icon(
                Icons.keyboard_arrow_right,
              ),
              onTap: () {},
            ),
            Divider(),
            SwitchListTile(
              title: Text(
                "Uygulama Teması",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                "On",
                //style: greyTExt,
              ),
              value: true,
              onChanged: (val) {},
            ),
            Divider(),
            SwitchListTile(
              title: Text(
                "Bildirimler",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                "Off",
                //style: greyTExt,
              ),
              value: false,
              onChanged: (val) {},
            ),
            Divider(),
            ListTile(
              title: Text(
                "İletişim",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              title: Text(
                "Çıkış Yap",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
