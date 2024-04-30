import 'package:flutter/material.dart';

import './widgets/kotak_warna.dart';

// Jika ingin membuat widget yang sama berulang kali dan 
// hanya merubah parameter saja menggunakan Extract widget

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("timKasir"),
        ),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              KotakWarna(
                text: "Merah",
                warna: Colors.red,
              ),
              KotakWarna(
                text: "Kuning",
                warna: Colors.yellow,
              ),
              KotakWarna(
                text: "Hijau",
                warna: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


