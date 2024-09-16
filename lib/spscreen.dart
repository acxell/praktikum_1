import 'package:flutter/material.dart';
import 'package:praktikum_1/RegisterScreen.dart';
import 'package:praktikum_1/land.dart';
import 'package:praktikum_1/page1.dart';
import 'package:praktikum_1/pinsrc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), () async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      final String? nbi = prefs.getString('nbi');

      if (nbi != null) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (build) {
          return landingPage();
        }));
      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (build) {
          return RegisterScreen();
        }));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromARGB(255, 1, 80, 13),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Expanded(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(
              "assets/images/pers.png",
              scale: 2,
            ),
            Text(
              "PRAKTIKUM PAB 2023",
              style: TextStyle(
                fontSize: 25,
                fontFamily: "poppins",
                height: 2,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ]),
        )
      ]),
    ));
  }
}
