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