import 'dart:convert';
import 'package:http/http.dart';
import 'package:weather_porcast/Model/weather_model.dart';
import 'package:weather_porcast/Util/forecast_util.dart';

class Network{

  Future<weather_model> getWeatherApi({required String cityName,required double temperature})async
  {
   var finalUrl="https://api.openweathermap.org/data/2.5/forecast/daily?q="+cityName+
       "&appid="+Util.AppId+"&units=imperial";
   final response=await get(Uri.parse(finalUrl));
   print("URL:${Uri.encodeFull(finalUrl)}");
   if(response.statusCode==200){
     print("Weather data:${response.body}");
     return weather_model.fromJson(jsonDecode(response.body));

   }else{
     throw Exception("Api faild");
   }
  }
}