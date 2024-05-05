import 'dart:math';

import 'package:app/features/components/Weather/weatherWidget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  //static const String routeName = '/home';

  // ignore_for_file: sort_child_properties_last

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Ana Sayfa"),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
              },
            ),
          ],
        ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            verticalDirection: VerticalDirection.down,
            children: [
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(left: 20),
                child: const Text(
                  "Hava Durumu",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              WeatherWidget(),
              SizedBox(height: 15,),
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(left: 20),
                child: const Text(
                  "Haberler",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              destinations(),
              SizedBox(height: 15,),
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(left: 20),
                child: const Text(
                  "Sizin İçin Öneriler",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              promo(),
              const SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }

  Container promo() {
    return Container(
      alignment: Alignment.bottomLeft,
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      height: 75,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Center(
            child: Card(
              child: SizedBox(
                width: 300,
                child: ListTile(
                  onTap: () {},
                  leading: const CircleAvatar(
                    backgroundColor: Colors.green,
                    child: Icon(
                      Icons.video_collection,
                    ),
                  ),
                  title: const Text(
                    "Budama",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: const Text("Budama nasıl yapılır?"),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Container destinations() {
    return Container(
      alignment: Alignment.bottomLeft,
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      height: 350,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(right: 10.0),
              child: Card(
                shadowColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: SizedBox(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: DecoratedBox(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        verticalDirection: VerticalDirection.down,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 90, bottom: 10),
                            child: Text(
                              "Palomena Prasina",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(20, 0, 0, 20),
                            child: Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 30),
                                  child: const Icon(
                                    Icons.place,
                                    color: Colors.white,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right: 100),
                                  child: const Text(
                                    "Dereli/Giresun",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      position: DecorationPosition.background,
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage("https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRE0MT7DZjztV7IM9peSHpEvyGQVXit-vORxhVMmeiZcrQHMcJa"),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}