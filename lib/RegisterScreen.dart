import 'package:flutter/material.dart';
import 'package:praktikum_1/pinsrc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'widget/fieldCustom.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();

  TextEditingController namaController = TextEditingController();
  TextEditingController nbiController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController igController = TextEditingController();
  TextEditingController pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/otakk.png',
                  scale: 4,
                ),
                SizedBox(height: 20),
                Text(
                  "Welcome To",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Praktikum PAB 2023",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                textFieldCustom('Masukkan Nama', namaController),
                textFieldCustom('Masukkan NBI', nbiController),
                textFieldCustom('Masukkan Email', emailController),
                textFieldCustom('Masukkan Alamat', alamatController),
                textFieldCustom('Masukkan Akun Instagram', igController),
                textFieldCustom('Masukkan PIN', pinController),
                SizedBox(height: 30),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      final SharedPreferences prefs =
                          await SharedPreferences.getInstance();

                      await prefs.setString('nama', namaController.text);
                      await prefs.setString('nbi', nbiController.text);
                      await prefs.setString('email', emailController.text);
                      await prefs.setString('alamat', alamatController.text);
                      await prefs.setString('ig', igController.text);
                      await prefs.setString('pin', pinController.text);

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) {
                          return pinScreen();
                        }),
                      );
                    }
                  },
                  child: Text("Daftar"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
