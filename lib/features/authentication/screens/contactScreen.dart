import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'İletişim Bilgileri',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              leading: Icon(Icons.email),
              title: Text('E-posta'),
              subtitle: Text('ornek@email.com'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Telefon'),
              subtitle: Text('+90 123 456 78 90'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Adres'),
              subtitle: Text('Örnek Mahallesi, Örnek Sokak No: 1, Örnek İlçe, Örnek Şehir'),
            ),
            Divider(),
            SizedBox(height: 35,),
            ElevatedButton(
              onPressed: () {

              },
              child: Text('İletişim Formu'),
            ),
          ],
        ),
      ),
    );
  }
}
