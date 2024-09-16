import 'package:flutter/material.dart';

Padding textFieldCustom(String ttl, TextEditingController ctrl) {
  return Padding(
    padding: const EdgeInsets.only(top: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 300,
          height: 50,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
          child: TextFormField(
            controller: ctrl,
            validator: (value) {
              if (value!.isEmpty) {
                return 'input tidak boleh kosong';
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: ttl,
              prefix: SizedBox(
                width: 8,
              ), // Menambahkan prefix untuk memberikan ruang di depan teks
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  width: 1.0, // Mengatur lebar border menjadi 1.0
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.green,
                  width: 1.0, // Mengatur lebar border menjadi 1.0
                ),
              ),
              errorStyle: TextStyle(
                height: 0, // Mengatur ketinggian pesan kesalahan menjadi 0
              ),
              floatingLabelBehavior: FloatingLabelBehavior
                  .auto, // Label akan berada di dalam field saat kosong
            ),
          ),
        ),
      ],
    ),
  );
}
