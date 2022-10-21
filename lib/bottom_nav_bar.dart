import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/common.dart';
import 'package:hackathon/compte/views/compte_screen.dart';
import 'package:hackathon/home/views/home.dart';
import 'package:hackathon/rendez-vous/views/tabs.dart';

class buttom_navrbar extends StatefulWidget {
  @override
  _buttom_navrbarState createState() => _buttom_navrbarState();
}

class _buttom_navrbarState extends State<buttom_navrbar> {
  List children = [const Homepage(), const TabBarPage(), const CompteScreen()];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: children[_currentIndex],
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: Pcol,
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() => _currentIndex = index),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            title: Text('Acceuil'),
            activeColor: Colors.white,
            textAlign: TextAlign.center,
            icon: Icon(
              Icons.home_outlined,
              color: Colors.white,
            ),
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.calendar_month),
            inactiveColor: Colors.white,
            title: Text(
              'Rendez-vous ',
              style: TextStyle(fontSize: 12),
            ),
            activeColor: Colors.white,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.settings),
            title: Text(
              'Compte',
              style: TextStyle(fontSize: 12),
            ),
            inactiveColor: Colors.white,
            activeColor: Colors.white,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
