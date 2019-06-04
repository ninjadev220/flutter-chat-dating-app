import 'package:flutter_weather/src/utils/converters.dart';

class Weather {
  int id;
  int time;
  String description;
  String icon;
  String main;
  String cityName;
  double temperature;
  double maxTemperature;
  double minTemperature;
  List<Weather> forecast;

  Weather(
      {this.id,
      this.time,
      this.description,
      this.icon,
      this.main,
      this.cityName,
      this.temperature,
      this.maxTemperature,
      this.minTemperature});


  static Weather fromJson(Map<String, dynamic> json) {
    final weather = json['weather'][0];
    return Weather(
        id: weather['id'],
        description: weather['description'],
        icon: weather['icon'],
        main: weather['main'],
        cityName: json['name'],
        temperature: intToDouble(json['main']['temp']),
        maxTemperature: intToDouble(json['main']['temp_max']),
        minTemperature: intToDouble(json['main']['temp_min']),
        time: json['dt']);
  }

  static List<Weather> fromForecastJson(Map<String, dynamic> json) {
    final weathers = List<Weather>();
    for (final item in json['list']) {
      weathers.add(Weather(
          time: item['dt'], temperature: intToDouble(item['main']['temp'])));
    }
    return weathers;
  }

  double get temperatureAsCelsius {
    return temperature - 273.15;
  }

  @override
  String toString() {
    return 'Weather{id: $id, description: $description, icon: $icon, main: $main, cityName: $cityName, temperature: $temperature, maxTemperature: $maxTemperature, minTemperature: $minTemperature}';
  }
}
