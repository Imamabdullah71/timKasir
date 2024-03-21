// Widget Builder

import 'dart:math';

import 'package:flutter/material.dart';

import './widgets/kotak_warna.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // final List<KotakWarna> allItems = List.generate(
  //   10,
  //   (index) => KotakWarna(
  //     text: "Kotak - ${index + 1}",
  //     warna: Color.fromARGB(
  //       255,
  //       200 + Random().nextInt(256),
  //       200 + Random().nextInt(256),
  //       200 + Random().nextInt(256),
  //     ),
  //   ),
  // );

  // List<Map<String, dynamic>> data = List.generate(
  //   10,
  //   (index) => {
  //     "text": "Kotak - ${index + 1}",
  //     "color": Color.fromARGB(
  //       255,
  //       200 + Random().nextInt(256),
  //       200 + Random().nextInt(256),
  //       200 + Random().nextInt(256),
  //     ),
  //   },
  // );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("timKasir"),
        ),
        body: GridView.builder(
          itemCount: 30,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
          ),
          itemBuilder: (context, index) => Container(
            color: Color.fromARGB(
              255,
              60 + Random().nextInt(151),
              60 + Random().nextInt(151),
              60 + Random().nextInt(151),
            ),
          ),
        ),

        // ListView.builder(
        //   itemCount: 10,
        //   itemBuilder: (context, index) => KotakWarna(
        //     text: "Kotak ke - ${index + 1}",
        //     warna: Color.fromARGB(
        //       250,
        //       150 + Random().nextInt(200),
        //       150 + Random().nextInt(200),
        //       150 + Random().nextInt(200),
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
