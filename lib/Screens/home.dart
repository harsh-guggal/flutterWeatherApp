import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutterweatherapp/Screens/loading.dart';
import 'package:searchbar_animation/searchbar_animation.dart';

class HomeScreen extends StatefulWidget {
  String temp_value,
      hum_value,
      air_speed_value,
      des_value,
      main_value,
      city_value;

  HomeScreen(
      {Key? key,
      required this.air_speed_value,
      required this.temp_value,
      required this.hum_value,
      required this.des_value,
      required this.main_value,
      required this.city_value})
      : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();

  String? temp, hum, air_speed, des, main, city;

  @override
  void initState() {
    if (temp != "NA") {
      temp = widget.temp_value.substring(0, 4);
    } else {
      air_speed = "";
    }
    if (air_speed != "NA") {
      air_speed = widget.air_speed_value.substring(0, 3);
    } else {
      air_speed = "";
    }
    hum = widget.hum_value;
    des = widget.des_value;
    main = widget.main_value;
    city = widget.city_value;

    super.initState();
  }

  void fun() {
    print(widget.city_value.toString());
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    fun();
    return Scaffold(
      backgroundColor: const Color.fromARGB(179, 98, 120, 136),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          color: const Color.fromARGB(179, 98, 120, 136),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 30, bottom: 10),
                child: SearchBarAnimation(
                  textEditingController: searchController,
                  isOriginalAnimation: true,
                  buttonBorderColour: Colors.black45,
                  buttonIcon: Icons.search,
                  onFieldSubmitted: (String value) {
                    // debugPrint('onFieldSubmitted value $value');
                    // Fluttertoast.showToast(msg: "serach clciked + $value");
                    // print("value is $value");

                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Loading(
                                  search: value.toString(),
                                )));
                  },
                ),
              ),
              Container(
                  padding: const EdgeInsets.only(left: 10, top: 20),
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: size.height / 2.6,
                  width: size.width,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          city!,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 28,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              main!,
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Icon(Icons.wb_sunny_outlined),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                              "$temp\u1d52",
                              style: const TextStyle(
                                fontSize: 46,
                              ),
                              textScaleFactor: 0.95,
                            ),
                            const Text(
                              "C",
                              style: TextStyle(
                                fontSize: 24,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: size.width / 3.5,
                              child: Column(
                                children: const [
                                  Icon(Icons.wind_power),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5, bottom: 5),
                                    child: Text(
                                      "Sunrise",
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "05 : 04 AM",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: size.width / 3.5,
                              child: Column(
                                children: [
                                  const Icon(Icons.wind_power),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 5, bottom: 5),
                                    child: Text(
                                      "Wind",
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "$air_speed Km/hr",
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: size.width / 3.5,
                              child: Column(
                                children: const [
                                  Icon(Icons.wind_power),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5, bottom: 5),
                                    child: Text(
                                      "Sunset",
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "06 : 45 PM",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Humidity",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "$hum%",
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.only(left: 10, top: 5),
                margin: const EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  // color: Colors.purple,
                ),
                width: size.width,
                height: size.height / 2.3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "5-Day Forecast",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white,
                              ),
                              child: const Icon(
                                Icons.cloud,
                                color: Colors.black,
                                size: 36,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              width: 110,
                              child: Column(
                                children: const [
                                  Text(
                                    "Thunderstorm",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "12 Aug 2022",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color.fromARGB(255, 229, 223, 223),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Row(
                              children: const [
                                Text(
                                  "33\u1d52",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "/ ",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "25\u1d52",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white,
                          ),
                          child: const Icon(
                            Icons.sunny,
                            color: Colors.black,
                            size: 36,
                          ),
                        ),
                        Container(
                          width: 80,
                          child: Column(
                            children: const [
                              Text(
                                "Sunny",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "13 Aug 2022",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 229, 223, 223),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: const [
                            Text(
                              "33\u1d52",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "/ ",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "25\u1d52",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white,
                          ),
                          child: const Icon(
                            Icons.cloudy_snowing,
                            color: Colors.black,
                            size: 36,
                          ),
                        ),
                        Column(
                          children: const [
                            Text(
                              "Rain",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Tomorrow, 14 Aug 2022",
                              style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 229, 223, 223),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: const [
                            Text(
                              "33\u1d52",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "/ ",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "25\u1d52",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white,
                          ),
                          child: const Icon(
                            Icons.wind_power_outlined,
                            color: Colors.black,
                            size: 36,
                          ),
                        ),
                        Column(
                          children: const [
                            Text(
                              "Windy",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Saturday, 15 Aug 2022",
                              style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 229, 223, 223),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: const [
                            Text(
                              "33\u1d52",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "/ ",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "25\u1d52",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white,
                          ),
                          child: const Icon(
                            Icons.wb_cloudy,
                            color: Colors.black,
                            size: 36,
                          ),
                        ),
                        Column(
                          children: const [
                            Text(
                              "Cloudy",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Sunday, 16 Aug 2022",
                              style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 229, 223, 223),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: const [
                            Text(
                              "30\u1d52",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "/ ",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "26\u1d52",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
