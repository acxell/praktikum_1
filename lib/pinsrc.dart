import 'package:flutter/material.dart';
import 'package:praktikum_1/RegisterScreen.dart';
import 'package:praktikum_1/botnavbar.dart';
import 'package:praktikum_1/page1.dart';
import 'package:praktikum_1/widget/fieldCustom.dart';
import 'package:shared_preferences/shared_preferences.dart';

class pinScreen extends StatefulWidget {
  const pinScreen({Key? key}) : super(key: key);

  @override
  State<pinScreen> createState() => _pinScreenState();
}

class _pinScreenState extends State<pinScreen> {
  final formkey = GlobalKey<FormState>();

  TextEditingController pinaccController = TextEditingController();
  String? pinacc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: Form(
            key: formkey,
            child: Container(
              margin:
                  EdgeInsets.only(top: 240, bottom: 150, right: 60, left: 60),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Enter your PIN",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      "Please enter your pin that you have created",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(8),
                      child: Icon(
                        Icons.lock_outline,
                        color: Colors.red,
                        size: 50,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          textFieldCustom('PIN', pinaccController),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 25,
                              right: 25,
                              top: 30,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Material(
                                child: InkWell(
                                    child: Ink(
                                      child: Icon(
                                        Icons.lock_outline,
                                        color: Colors.white,
                                      ),
                                      color: Colors.blue,
                                      height: 40,
                                      width: 100,
                                    ),
                                    onTap: () async {
                                      if (formkey.currentState!.validate()) {
                                        pinacc = pinaccController.text;
                                        final SharedPreferences prefs =
                                            await SharedPreferences
                                                .getInstance();
                                        final String? pin =
                                            prefs.getString('pin');

                                        if (pinacc == pin) {
                                          Navigator.pushReplacement(context,
                                              MaterialPageRoute(
                                                  builder: (build) {
                                            return BottomNavigation();
                                          }));
                                        } else {
                                          showDialog<String>(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                AlertDialog(
                                              title: const Text('Password'),
                                              content: const Text(
                                                  'Password yang anda inputkan salah!'),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          context, 'OK'),
                                                  child: const Text('OK'),
                                                ),
                                              ],
                                            ),
                                          );
                                        }
                                      }
                                      ;
                                    }),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
