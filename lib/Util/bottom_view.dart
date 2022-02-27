import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_porcast/Model/weather_model.dart';

import 'forecast_card.dart';

Widget bottomview(AsyncSnapshot<weather_model> snapshot, BuildContext) {
  var foreCastList = snapshot.data?.list;
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(
        "7 days weather forecast".toUpperCase(),
        style: TextStyle(fontSize: 15, color: Colors.black87),
      ),
      Container(
        height: 150,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2.7,
                    height: 160,
                    child: foreCastCard(snapshot, index),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xff9661c3), Colors.white],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight)),
                  ),
                ),
            separatorBuilder: (context, index) => SizedBox(
                  width: 10,
                ),
            itemCount: 7),
      )
    ],
  );
}
