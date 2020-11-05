import 'package:flutter/material.dart';

class Child extends StatelessWidget {
  Child({this.icon, this.txt});
  final IconData icon;
  final String txt;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            size: 50,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            txt,
            style: TextStyle(fontSize: 20, color: Color(0xFF8D8E98)),
          )
        ],
      ),
    );
  }
}
