// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

class MovieTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400.0,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            image: DecorationImage(
              image: AssetImage("images/venom.jpg"),
              fit: BoxFit.fill,
            )));
  }
}
