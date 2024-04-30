import 'dart:math';

import 'package:flutter/material.dart';

import './widgets/kotak_warna.dart';

// List of Mapping -> Untuk membuat list yang berulang

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

  List<Map<String, dynamic>> data = List.generate(
    10,
    (index) => {
      "text": "Kotak - ${index + 1}",
      "color": Color.fromARGB(
        255,
        200 + Random().nextInt(256),
        200 + Random().nextInt(256),
        200 + Random().nextInt(256),
      ),
    },
  );

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("timKasir"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: data
                .map(
                  (e) => KotakWarna(
                    text: e["text"],
                    warna: e["color"],
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
