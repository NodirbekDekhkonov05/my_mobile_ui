import 'dart:convert';

import 'package:countries/models/countries_all_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';


class InfoPage extends StatelessWidget {
  String? nameOfCountry;
  String? capitalOfCountr;
  String? population;
  String? idd;
  String? region;
  InfoPage(this.nameOfCountry, this.capitalOfCountr, this.population, this.idd,
      this.region);
  PageController _controller = PageController(
    initialPage: 0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 220.0,
              width: double.infinity,
              child: PageView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image:
                          NetworkImage("https://source.unsplash.com/random/1"),
                      fit: BoxFit.cover,
                    )),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image:
                          NetworkImage("https://source.unsplash.com/random/2"),
                      fit: BoxFit.cover,
                    )),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image:
                          NetworkImage("https://source.unsplash.com/random/3"),
                      fit: BoxFit.cover,
                    )),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 20.0,
              ),
              child: Text(
                this.nameOfCountry.toString(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 20.0,
                top: 20.0,
                bottom: 20.0,
              ),
              child: Text(
                this.capitalOfCountr.toString(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 20.0,
                bottom: 10.0,
                right: 20.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.phone,
                    ),
                    splashColor: Colors.grey[200],
                    splashRadius: 30.0,
                  ),
                  IconButton(
                    onPressed: () {
                      launch(
                          "https://www.google.ru/maps/@41.2831386,69.2043005,15z");
                    },
                    icon: Icon(
                      Icons.navigation_sharp,
                    ),
                    splashColor: Colors.grey[200],
                    splashRadius: 30.0,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.forward,
                    ),
                    splashColor: Colors.grey[200],
                    splashRadius: 30.0,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.calendar_today_outlined,
                    ),
                    splashColor: Colors.grey[200],
                    splashRadius: 30.0,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      fixedSize: Size(110, 40),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.green, width: 1),
                          borderRadius: BorderRadius.circular(
                            10.0,
                          )),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Follow",
                      style: TextStyle(
                        color: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Container(
              margin: EdgeInsets.only(
                left: 20.0,
                top: 10.0,
              ),
              child: Text(
                "Information",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 15.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        "⭐️" + " ${this.idd}",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "431 reviews",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        this.population.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Population",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Area",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        this.region.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: 220.0,
              width: double.infinity,
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ),
                    child: Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17.0,
                      ),
                      maxLines: 5,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 14.0,
                      vertical: 10.0,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          12.0,
                        ),
                        color: Colors.grey[300]),
                    child: ExpansionTile(
                      title: Text(
                        "Show scorecard",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 45.0,
              ),
              child: Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        fixedSize: Size(150, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(
                              color: Colors.green,
                            ))),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Preview",
                      style: TextStyle(
                        color: Colors.green,
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
            ),
          ],
        ),
      ),
    );
  }

  Future<List<Countries>> _getInfoFromApi() async {
    final _response =
        await http.get(Uri.parse("https://restcountries.com/v3.1/all"));
    if (_response.statusCode == 200) {
      return (json.decode(_response.body) as List)
          .map((e) => Countries.fromJson(e))
          .toList();
    } else {
      throw Exception("Error");
    }
  }
}
