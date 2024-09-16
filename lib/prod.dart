import 'package:flutter/material.dart';
import 'package:praktikum_1/widget/ListProd.dart';

class Prod extends StatefulWidget {
  const Prod({Key? key}) : super(key: key);

  @override
  State<Prod> createState() => _ProdState();
}

class _ProdState extends State<Prod> {
  bool change = false;

  List prod = [
    {"img": "assets/images/look.jpeg", "txt": "White Plain Shirt"},
    {"img": "assets/images/a.jpeg", "txt": "Brown Plain Shirt"},
    {"img": "assets/images/b.jpeg", "txt": "Cream Plain Shirt"},
    {"img": "assets/images/c.jpeg", "txt": "Green Plain Shirt"},
    {"img": "assets/images/d.jpeg", "txt": "Yellow Plain Shirt"},
    {"img": "assets/images/e.jpeg", "txt": "Black Shirt"},
    {"img": "assets/images/f.jpeg", "txt": "Green Bomber"},
    {"img": "assets/images/g.jpeg", "txt": "Flanel"},
    {"img": "assets/images/h.jpeg", "txt": "Black Bag"},
    {"img": "assets/images/kin.jpeg", "txt": "Black Coat"}
  ];

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
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            SizedBox(
              width: 500,
              height: 560,
              child: ListView.builder(
                  itemCount: prod.length,
                  itemBuilder: (context, index) {
                    return list_prod(
                        img: prod[index]["img"], txt: prod[index]["txt"]);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
