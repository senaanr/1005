import 'package:flutter/material.dart';

class DetailContainer extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const DetailContainer({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          // Arka plan resmi
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4), // Karartma rengi ve opaklığı burada ayarlanıyor
            ),
          ),
          // Resim ve bilgilerin olduğu container
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.9), // Buradaki sayıyı istediğiniz değere ayarlayabilirsiniz
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start, // Resmi başlığın altına kaydırmak için mainAxisAlignment'i MainAxisAlignment.start olarak ayarlayın
                children: [
                  SizedBox(height: 100), // Başlığın yüksekliği kadar bir boşluk ekleyin
                  Image.network(
                    imagePath,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: 5),
                  Text(
                    description,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
