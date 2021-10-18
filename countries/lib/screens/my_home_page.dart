import 'dart:convert';

import 'package:countries/models/countries_all_data.dart';
import 'package:countries/screens/weather_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _controller = TextEditingController();

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: 750.0,
            margin: EdgeInsets.only(
              top: 20.0,
              left: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Countries",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  child: Text(
                    "Find a place to play golf",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17.0,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    right: 15.0,
                  ),
                  child: TextFormField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Type to search...",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 15.0,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          setState(() {});
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 25.0,
                    right: 15.0,
                    bottom: 15.0,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nearby Countries",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            "Near from Allison Park, PA 15101",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                      TextButton(
                        style: TextButton.styleFrom(primary: Colors.green),
                        onPressed: () {},
                        child: Text(
                          "View All",
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                FutureBuilder(
                  future: _getInfoFromApi(),
                  builder: (context, AsyncSnapshot<List<Countries>> snap) {
                    var data = snap.data;

                    if (snap.hasData) {
                      return Container(
                        height: 260.0,
                        width: double.infinity,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return InkWell(
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                height: 270.0,
                                width: 180.0,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(20.0),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      data![index].flags!.png.toString(),
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 180.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data[index]
                                                .name!
                                                .official
                                                .toString(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 6.0,
                                          ),
                                          Text(
                                            "Area of Country: ${data[index].area}",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15.0,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => WeatherPage1(
                                      data[0].flags!.png.toString(),
                                      data[index].capital.toString(),
                                      data[index].name!.official.toString(),
                                      data[index].population.toString(),
                                      data[index].idd!.root.toString(),
                                      data[index].region.toString(),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          itemCount: data!.length,
                        ),
                      );
                    } else {
                      return Center(
                        child: CupertinoActivityIndicator(),
                      );
                    }
                  },
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Top Rated",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "View All",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                FutureBuilder(
                  future: _getContainer(),
                  builder: (context, AsyncSnapshot<List<Countries>> snap) {
                    var data = snap.data;
                    if (snap.hasData) {
                      return InkWell(
                        child: Container(
                          margin: EdgeInsets.only(right: 20.0),
                          alignment: Alignment.bottomCenter,
                          height: 200.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            image: DecorationImage(
                              image: NetworkImage(
                                data![0].flags!.png.toString(),
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Text(
                            data[0].name!.official.toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WeatherPage1(
                                        data[0].flags!.png.toString(),
                                        data[0].capital.toString(),
                                        data[0].name!.official.toString(),
                                        data[0].population.toString(),
                                        data[0].idd!.root.toString(),
                                        data[0].region.toString(),
                                      )));
                        },
                      );
                    } else {
                      return Container();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (v) {
          setState(() {
            _selectedIndex = v;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: "",
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(
              Icons.search,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(
              Icons.stacked_bar_chart_sharp,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(Icons.golf_course),
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
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

  Future<List<Countries>> _getContainer() async {
    final _response = await http.get(
        Uri.parse("https://restcountries.com/v3.1/name/${_controller.text}"));
    if (_response.statusCode == 200) {
      return (json.decode(_response.body) as List)
          .map((e) => Countries.fromJson(e))
          .toList();
    } else {
      throw Exception("Error");
    }
  }
}
