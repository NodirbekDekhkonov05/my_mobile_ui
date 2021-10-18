import 'dart:convert';

import 'package:countries/models/weather_detail.dart';
import 'package:countries/screens/info_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class WeatherPage1 extends StatelessWidget {
  String? img;
  String? nameOfCountry;
  String? capitalOfCountry;
  String? weatherOfCapital;
  String? population;
  String? idd;
  String? region;
  

  WeatherPage1(
    this.img,
    this.capitalOfCountry,
    this.nameOfCountry,
    this.population,
    this.idd,
    this.region,
  );

  Weather? weather;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(this.img.toString()),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 540.0,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10.0),
                        height: 70.0,
                        width: 70.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:
                                AssetImage("assets/images/cloud_and_sunny.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      FutureBuilder(
                        future: _getWeatherInfoApi(),
                        builder: (context, AsyncSnapshot<Weather> snap) {
                          var data = snap.data;
                          print(data);
                          if (snap.hasData) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data!.weather![0].main.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Wind: ${data.wind!.speed}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return Center(
                              child: CupertinoActivityIndicator(),
                            );
                          }
                        },
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 10.0,
                      bottom: 20.0,
                    ),
                    child: Text(
                      this.nameOfCountry.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 33.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 15.0),
                    child: Text(
                      this.capitalOfCountry.toString().replaceAll(('['),'').replaceAll(']', ''),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        fixedSize: Size(150, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(
                              color: Colors.white,
                            ))),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InfoPage(
                            nameOfCountry.toString(),
                            capitalOfCountry.toString(),
                            population.toString(),
                            idd.toString(),
                            region.toString(),
                          ),
                        ),
                      );
                    },
                    child: Text(
                      "Preview",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        fixedSize: Size(150, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                    onPressed: () {},
                    child: Text(
                      "Start Round",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<Weather> _getWeatherInfoApi() async {
    try {
      var response = await http.get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$nameOfCountry&appid=0a5510fc38c923a147f2d2a0f65ecb13"));
      var decodeJson = json.decode(response.body);
      weather = Weather.fromJson(decodeJson);
      return weather!;
    } catch (e) {
      print(e.toString());
      throw Exception("Error");
    }
  }
}
