import 'package:flutter/material.dart';
import 'package:weather_porcast/UI/home.dart';
void main(){
  runApp(WeatherApp());
}
class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
