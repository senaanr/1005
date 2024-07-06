import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../VideoPlayer/VideoPlayerWidget.dart';
import '../YoutubePlayer/YoutubePlayerWidget.dart';

class DetailContainer extends StatelessWidget {
  final List<String> imagePaths;
  final List<String> videoPaths;
  final List<String> youtubeUrls;
  final String title;
  final String description;

  DetailContainer({
    Key? key,
    required this.imagePaths,
    required this.videoPaths,
    required this.youtubeUrls,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> carouselItems = [];

    for (var imagePath in imagePaths) {
      carouselItems.add(
        Container(
          width: MediaQuery.of(context).size.width,
          child: Image.network(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    for (var videoPath in videoPaths) {
      carouselItems.add(
        Container(
          width: MediaQuery.of(context).size.width,
          child: VideoPlayerWidget(videoPath: videoPath),
        ),
      );
    }

    for (var youtubeUrl in youtubeUrls) {
      carouselItems.add(
        Container(
          width: MediaQuery.of(context).size.width,
          child: YouTubePlayerWidget(url: youtubeUrl),
        ),
      );
    }

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
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imagePaths[0]),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.9),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 100),
                  CarouselSlider(
                    options: CarouselOptions(
                      height: MediaQuery.of(context).size.width,
                      viewportFraction: 1.0,
                      enlargeCenterPage: false,
                    ),
                    items: carouselItems,
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
