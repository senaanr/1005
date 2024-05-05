import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WeatherWidget extends StatefulWidget {
  @override
  _WeatherWidgetState createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  late Future<Weather> futureWeather;

  @override
  void initState() {
    super.initState();
    futureWeather = fetchWeather();
  }

  Future<Weather> fetchWeather() async {
    const apiKey = 'ee0716c88eb14be29f4182517240405';
    const city = 'Samsun';

    final response = await http.get(
      Uri.parse(
          'https://api.weatherapi.com/v1/current.json?key=$apiKey&q=$city'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return Weather.fromJson(data['current']);
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Color getBackgroundColor(String condition) {
    if (condition.toLowerCase().contains('sunny')) {
      return Colors.yellow;
    } else {
      return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Weather>(
      future: futureWeather,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final weather = snapshot.data!;
          final backgroundColor = getBackgroundColor(weather.condition);
          late Widget weatherIcon;

          if (weather.condition.toLowerCase().contains('sunny')) {
            weatherIcon =const Icon(Icons.wb_sunny);
          } else if (weather.condition.toLowerCase().contains('cloud')) {
            weatherIcon = const Icon(Icons.cloud);
          } else if (weather.condition.toLowerCase().contains('rain')) {
            weatherIcon = const Icon(Icons.beach_access);
          } else {
            weatherIcon = const Icon(Icons.cloud_off);
          }

          return Container(
            margin: const EdgeInsets.all(10.0),
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10.0),
              color: backgroundColor,
            ),
            child: Row(
              children: [
                weatherIcon,
                const SizedBox(width: 50),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Sıcaklık: ${weather.temperatureC}°C',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('Hava Durumu: ${weather.condition}'),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return CircularProgressIndicator();
      },
    );
  }
}

  class Weather {
  final double temperatureC;
  final String condition;

  Weather({required this.temperatureC, required this.condition});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      temperatureC: json['temp_c'],
      condition: json['condition']['text'],
    );
  }
}
