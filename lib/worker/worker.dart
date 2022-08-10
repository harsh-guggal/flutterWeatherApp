import 'dart:convert';

import 'package:http/http.dart';

class Worker {
  String location = "Indri";

  Worker({required this.location}) {
    location = location;
  }

  String? temp;
  String? humidity;
  String? air_speed;
  String? description;
  String? main;
  String? icon;
  String? sunrise;
  String? sunset;

  Future<void> getData() async {
    try {
      Response response = await get(Uri.parse(
          'http://api.openweathermap.org/data/2.5/weather?q=$location&appid=e34a5eb0b4c5ff748fdf9219a63d224e'));
      Map data = await jsonDecode(response.body);

      Map main_data = data['main'];
      List weather = data['weather'];
      Map weather_data = weather[0];

      Map wind_data = data['wind'];

      Map sys_data = data['sys'];

      temp = (main_data['temp'] - 273.15).toString();
      // print(temp);

      humidity = main_data['humidity'].toString();
      // print(humidity);
      main = weather_data['main'];
      // print(main);
      description = weather_data['description'];
      // print(description);
      icon = weather_data['icon'];
      // print(icon);
      air_speed = (wind_data['speed'] / 0.2777).toString();
      // print(air_speed);
      sunrise = sys_data['sunrise'].toString();
      // print(sunrise);
      sunset = sys_data['sunset'].toString();
      // print(sunset);
    } catch (e) {
      temp = "NA";
      humidity = "NA";
      air_speed = "NA";
      description = "NA";
      main = "NA";
      icon = "NA";
      sunrise = "NA";
      sunset = "NA";
    }
  }
}
