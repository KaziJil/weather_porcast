import 'package:flutter/material.dart';
import 'package:weather_porcast/Model/weather_model.dart';
Widget foreCastCard(AsyncSnapshot<weather_model>snapshot,int index){
  
  var forecastList=snapshot.data?.list;
  var dayOfWeek="";
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Container(
      margin: EdgeInsets.all(10),
      child: Text("${forecastList?[0].dt}"),
    ),
  ],
  );

}