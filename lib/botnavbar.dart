import 'package:flutter/material.dart';
import 'package:praktikum_1/api.dart';
import 'package:praktikum_1/home.dart';
import 'package:praktikum_1/prod.dart';
import 'package:praktikum_1/profile.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectIndex = 0;

  List<Widget> _screenList = [home(), Prod(), apiScreen(), Profile()];

  void change(int Index) {
    setState(() {
      _selectIndex = Index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screenList[_selectIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectIndex,
          backgroundColor: Colors.white,
          fixedColor: Colors.red,
          onTap: change,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Shop'),
            BottomNavigationBarItem(icon: Icon(Icons.fireplace), label: 'API'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
          ]),
    );
  }
}
