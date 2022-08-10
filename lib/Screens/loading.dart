import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutterweatherapp/Screens/home.dart';
import 'package:flutterweatherapp/worker/worker.dart';
import 'package:progress_indicators/progress_indicators.dart';

class Loading extends StatefulWidget {
  String? search;
  Loading({Key? key, this.search}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String? city = "Indri";
  String? temp;
  String? hum;
  String? air_speed;
  String? des;
  String? main;
  String? icon;

  startup(String city) async {
    Worker instance = Worker(location: city);

    await instance.getData();

    temp = instance.temp;
    hum = instance.humidity;
    air_speed = instance.air_speed;
    des = instance.description;
    main = instance.main;
    icon = instance.icon;

    print(temp! +
        " " +
        hum! +
        " " +
        air_speed! +
        " " +
        des! +
        " " +
        main! +
        " " +
        icon! +
        " ");

    Future.delayed(
        const Duration(seconds: 2),
        () => {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => HomeScreen(
                      temp_value: temp.toString(),
                      hum_value: hum.toString(),
                      air_speed_value: air_speed.toString(),
                      des_value: des.toString(),
                      main_value: main.toString(),
                      city_value: city.toString(),
                    ),
                  ))
            });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.search?.isEmpty ?? true) {
      city = "Indri";
    } else {
      city = widget.search;
    }

    startup(city.toString());
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        // padding: const EdgeInsets.only(top: 50),
        width: size.width,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width / 3,
              child: Image.asset(
                "assets/weather.png",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Guggal Weather App",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            JumpingText(
              'Loading...',
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
