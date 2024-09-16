import 'package:flutter/material.dart';
import 'package:praktikum_1/api/apiController.dart';
import 'package:praktikum_1/widget/ListApi.dart';

class apiScreen extends StatefulWidget {
  const apiScreen({Key? key}) : super(key: key);

  @override
  State<apiScreen> createState() => _apiScreenState();
}

class _apiScreenState extends State<apiScreen> {
  Future<List<dynamic>>? _data;

  @override
  void initState() {
    // TODO: implement initState
    _data = ApiController().getdatas();
    super.initState();
  }

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
        child: FutureBuilder<List<dynamic>>(
            future: _data,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print('Ini adalah Data ${snapshot.data}');
                return SizedBox(
                  width: 500,
                  height: 700,
                  child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return list_api(
                          img: snapshot.data![index]['image'],
                          desc: snapshot.data![index]['title'],
                        );
                      }),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
              }
            }),
      ),
    );
  }
}
