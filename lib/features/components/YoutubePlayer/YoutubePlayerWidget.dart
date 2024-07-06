import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class YouTubePlayerWidget extends StatelessWidget {
  final String url;

  YouTubePlayerWidget({required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final Uri uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        } else {
          throw 'Could not launch $url';
        }
      },
      child: Container(
        color: Colors.black,
        child: Center(
          child: Icon(
            Icons.play_circle_fill,
            color: Colors.white,
            size: 100,
          ),
        ),
      ),
    );
  }
}
