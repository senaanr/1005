import 'package:app/features/authentication/screens/DetailScreen.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../../utils/data.dart';

class WeedsScreen extends StatefulWidget {
  const WeedsScreen({Key? key}) : super(key: key);

  @override
  State<WeedsScreen> createState() => _WeedsScreenState();
}

class _WeedsScreenState extends State<WeedsScreen> {
  int _selectedIndex = 0;
  List<Map<String, dynamic>> animalData = DataRepository.weedsData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Title
                Center(
                  child: Text(
                    animalData[_selectedIndex]['title'],
                    style: const TextStyle(fontSize: 24, color: Colors.black),
                  ),
                ),
                const SizedBox(height: 20),
                // Slider Widget
                Expanded(
                  child: CarouselSlider.builder(
                    itemCount: animalData.length,
                    options: CarouselOptions(
                      height: 600,
                      viewportFraction: 0.7,
                      enlargeCenterPage: true,
                      initialPage: 2,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                    ),
                    itemBuilder: (context, index, realIdx) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(color: Colors.white, width: 3),
                                    ),
                                    height: 330,
                                    width: 300,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        animalData[index]['imagePath'],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    margin: const EdgeInsets.only(bottom: 20.0),
                                  ),
                                  const SizedBox(height: 20),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => InfoScreen(),
                                        ),
                                      );
                                    },
                                    child: Text('Devam'),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                // Indicator dots
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: animalData.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIndex = entry.key;
                        });
                      },
                      child: Container(
                        width: 8,
                        height: 8,
                        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 3),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _selectedIndex == entry.key ? Colors.blueAccent : Colors.grey,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}