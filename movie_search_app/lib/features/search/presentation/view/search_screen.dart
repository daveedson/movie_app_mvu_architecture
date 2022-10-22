// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Color(0xFFFEF9F3),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 55.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30.0),
              Row(
                children: [
                  Text("Movies",
                      style: TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black45)),
                  Spacer(),
                  Icon(
                    Icons.equalizer_outlined,
                    size: 35.0,
                    color: Colors.black45,
                  ),
                  SizedBox(width: 10.0),
                  CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 20.0,
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                      ))
                ],
              ),
              SizedBox(height: 15.0),
              SizedBox(
                height: 50.0,
                child: TextFormField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black45,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(color: Colors.black54)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(color: Colors.black54)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(color: Colors.black54)),
                      hintStyle: TextStyle(
                        color: Colors.black54,
                      ),
                      filled: true,
                      fillColor: Colors.white70,
                      hintText: 'Search'),
                ),
              ),
              SizedBox(height: 40.0),
              Container(
                height: 400.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
