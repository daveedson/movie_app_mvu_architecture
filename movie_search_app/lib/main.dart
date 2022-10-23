// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_search_app/features/details/presentation/view/details_screen.dart';
import 'package:movie_search_app/features/search/presentation/view/search_screen.dart';

void main() {
  runApp( ProviderScope(child:  MyApp()));
}


final dioProvider = Provider<Dio>((ref) {
  return Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3/',
     validateStatus: (statusCode){
        if(statusCode == null){
          return false;
        }
        if(statusCode == 422){ // your http status code
          return true;
        }else{
          return statusCode >= 200 && statusCode < 300;
        }
      },
  ));
});
class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: SearchScreen(),
    );
  }
}
