import 'package:app/features/authentication/screens/DetailScreen.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class EducateScreen extends StatefulWidget {
  const EducateScreen({Key? key}) : super(key: key);

  @override
  State<EducateScreen> createState() => _EducateScreenState();
}

class _EducateScreenState extends State<EducateScreen> {
  // Define data for each animal
  final List<Map<String, dynamic>> animalData = [
    {
      'title': 'SULAMA',
      'description': "Verimli sulama tekniklerini öğrenerek su kullanımını optimize edin ve sağlıklı ürün yetiştirmeyi destekleyin.",
      'imagePath': 'lib/images/sulama.jpg',
    },
    {
      'title': 'BUDAMA',
      'description':
      'Fındıkta diğer meyve türlerinden farklı olarak, dal yaşı ve dikim yaşı vardır. Ekonomik verim çağında olan bahçelerde, ocakların içinden kesilecek olan yaşlı dalların yerine, kesimden...',
      'imagePath': 'lib/images/budama.jpg',
    },
    {
      'title': 'GÜBRELEME',
      'description': 'Toprağın verimliliğini artırmak ve ürün verimini maksimize etmek için doğru gübreleme yöntemlerinin önemini keşfedin.',
      'imagePath': 'lib/images/gubreleme.jpg',
    },
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image with Opacity
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: Image.asset(
              animalData[_selectedIndex]['imagePath'],
              key: ValueKey<String>(animalData[_selectedIndex]['imagePath']),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.4), // Adjust opacity as needed
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Title
                Center(
                  child: Text(
                    animalData[_selectedIndex]['title'],
                    style: const TextStyle(fontSize: 24, color: Colors.white),
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
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      color: Color(0xFF54402F),
                                    ),
                                    child: Text(
                                      animalData[index]['description'],
                                      textAlign: TextAlign.justify,
                                      style: const TextStyle(fontSize: 14, color: Color(0xFFC7B6A7)),
                                    ),
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