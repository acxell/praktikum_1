import 'package:praktikum_1/prod.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
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
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/images/this.png",
                    height: 500,
                    width: 950,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Prod()),
                      );
                    },
                    child: Text("Product"),
                    style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size(250, 40)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blueGrey),
                        foregroundColor: MaterialStateProperty.all(
                            Colors.white) // Set the button size
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
}
