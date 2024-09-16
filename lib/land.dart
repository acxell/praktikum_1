import 'package:flutter/material.dart';
import 'package:praktikum_1/pinsrc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class landingPage extends StatefulWidget {
  const landingPage({super.key});

  @override
  State<landingPage> createState() => _landingPageState();
}

class _landingPageState extends State<landingPage> {
  String? nbi;
  String? nama;
  String? email;
  String? alamat;
  String? ig;

  void data() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? _nama = prefs.getString('nama');
    final String? _nbi = prefs.getString('nbi');
    final String? _email = prefs.getString('email');
    final String? _alamat = prefs.getString('alamat');
    final String? _ig = prefs.getString('ig');

    setState(() {
      nbi = _nbi;
      nama = _nama;
      email = _email;
      alamat = _alamat;
      ig = _ig;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data();
  }

  @override
  Widget build(BuildContext context) {
    print('$nbi');
    return Scaffold(
      appBar: AppBar(
        title: Text('welcome to flutter'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Welcome to',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontFamily: "poppins",
                height: 2.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'PRAKTIKUM PAB 2023',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontFamily: "poppins",
                height: 1.0,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$nbi",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "poppins",
                      height: 2.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Image.asset(
                    "assets/images/Katana.png",
                    height: 350,
                    width: 800,
                  ),
                  Text(
                    "$nama",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "poppins",
                      height: 2.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return pinScreen();
                      }),
                    );
                  },
                  child: Text("Masuk"),
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(
                        Size(250, 40)), // Set the button size
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
