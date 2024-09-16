import 'package:flutter/material.dart';
import 'package:praktikum_1/page1.dart';
import 'package:praktikum_1/pinsrc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'UNIQLO',
          style: TextStyle(
            fontSize: 30,
            fontFamily: "poppins",
            height: 0,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("assets/images/this.png"),
                            fit: BoxFit.cover)),
                  ),
                ),
                SizedBox(height: 4),
                Center(
                    child: Text(
                  "$nama",
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: "poppins",
                    fontWeight: FontWeight.bold,
                  ),
                )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: <Widget>[
                        Icon(Icons.person_2_sharp, size: 30),
                        Text(
                          "$nbi",
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: "poppins",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.email_outlined, size: 30),
                        Text(
                          "$email",
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: "poppins",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.home, size: 30),
                        Text(
                          "$alamat",
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: "poppins",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.camera_alt_outlined, size: 30),
                        Text(
                          "$ig",
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: "poppins",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return page1();
                          }),
                        );
                      },
                      child: Text("Keluar"),
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(
                            Size(250, 40)), // Set the button size
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
