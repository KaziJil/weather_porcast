import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_porcast/Model/weather_model.dart';
import 'package:weather_porcast/Network/network.dart';
import 'package:weather_porcast/Util/bottom_view.dart';
import 'package:weather_porcast/Util/conver_icon.dart';
import 'package:weather_porcast/Util/forecast_util.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<weather_model> weatherObject;
  String _cityName = "Feni";
  double _temperature = 20;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // weatherObject = Network().getWeatherApi(cityName: _cityName,_temperature:_temperature);
    weatherObject =
        Network().getWeatherApi(cityName: _cityName, temperature: _temperature);
    // weatherObject.then((weather) => {
    //   print(weather.list?[0].deg)
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              textField(),
              FutureBuilder<weather_model>(
                  future: weatherObject,
                  builder: (BuildContext context,
                      AsyncSnapshot<weather_model> snapshot) {
                    var forecastList = snapshot.data?.list;
                    if (snapshot.hasData) {
                      return Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${snapshot.data?.city?.name},${snapshot.data?.city?.country}",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Population:${snapshot.data?.city?.population}",
                              style: TextStyle(fontSize: 10, color: Colors.red),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Icon(
                              FontAwesomeIcons.cloud,size: 150,color: Colors.pink,
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${forecastList?[0].temp?.day?.toStringAsFixed(0)}F",
                                    style: TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(width: 10,),
                                  Text("${forecastList?[0].weather?[0].description?.toUpperCase()}"),

                                ],
                              ),

                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text("${forecastList?[0].speed?.toStringAsFixed(1)},ml/h"),
                                        Icon(FontAwesomeIcons.wind,size: 20,color: Colors.brown,)
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Text("${forecastList?[0].humidity?.toStringAsFixed(0)} %"),
                                          Icon(FontAwesomeIcons.solidGrinBeamSweat,size: 20,color: Colors.brown,)
                                        ],
                                      ),
                                    ),
                                      Row(
                                        children: [
                                          Column(
                                            children: [
                                              Text("${forecastList?[0].temp?.day?.toStringAsFixed(0)} F"),
                                              Icon(FontAwesomeIcons.temperatureHigh,size: 20,color: Colors.brown,)
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            bottomview(snapshot, (context))

                          ],
                        ),
                      );
                    } else {
                      return Container(
                        child: CircularProgressIndicator(),
                      );
                    }
                  })
            ],
          )
        ],
      ),
    );
  }

  Widget textField() {
    return Container(
      child: TextField(
        decoration: InputDecoration(
          hintText: "Enter Your City",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          prefixIcon: Icon(Icons.attach_money),
        ),
        onSubmitted: (value) {
          setState(() {
            _cityName = value;
            weatherObject = Network()
                .getWeatherApi(cityName: _cityName, temperature: _temperature);
          });
        },
      ),
    );
  }
}
