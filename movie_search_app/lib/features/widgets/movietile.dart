// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations

import 'package:flutter/material.dart';

class MovieTile extends StatelessWidget {
  final String rating;

  const MovieTile({super.key, required this.rating});
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Container(
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
              )),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey,
                child: Text("$rating", style: TextStyle(color: Colors.white)),
              ),
              Spacer(),
              Icon(
                Icons.favorite,
                color: Colors.grey,
                size: 40.0,
              ),
            ],
          ),
        )
      ],
    );
  }
}
