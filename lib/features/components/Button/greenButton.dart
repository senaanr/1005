import 'package:flutter/material.dart';

class GreenButton extends StatelessWidget {
  final String imagePath;
  final String label;
  final VoidCallback onPressed;
  final double? height;
  final double? width;
  final String? heroTag; // Yeni eklenen özellik

  const GreenButton({
    required this.imagePath,
    required this.label,
    required this.onPressed,
    this.heroTag, // Yeni eklenen özellik
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Hero(
      tag: heroTag ?? "", // Hero etiketi güncellendi
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green[200],
          padding: EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          minimumSize: Size( width ?? screenWidth * 0.6, height ?? screenHeight * 0.5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(
                imagePath,
                width: 83,
                height: 83,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              width: screenWidth * 0.3,
              height: screenHeight * 0.06,
              child: Text(
                label,
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
