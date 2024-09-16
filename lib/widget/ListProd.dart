import 'package:flutter/material.dart';

Center list_prod({required img, required txt}) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.only(top: 6.0),
      child: Container(
        width: 250,
        decoration: BoxDecoration(
            color: Colors.redAccent, borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      image: DecorationImage(
                          image: AssetImage(img), fit: BoxFit.cover)),
                ),
              ),
              SizedBox(height: 5),
              Container(
                margin: const EdgeInsets.only(left: 10.0),
                child: Center(
                  child: Text(
                    txt,
                    textAlign: TextAlign.justify,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: "poppins",
                        height: 2,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Add To Cart",
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: "poppins",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(Size(150, 10)),
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors
                              .yellow; // Change button color when pressed to yellow
                        }
                        return Colors.white; // Default button color
                      },
                    ),
                    foregroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors
                              .black; // Change text color when pressed to black
                        }
                        return Colors.black; // Default text color
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
