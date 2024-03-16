import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
/*
Materi :
  - home
  - body
  - backgroundColor
  - child
  => Widget :
    1. Scaffold
    2. Center
    3. Text
*/

// Untuk membuat StatelessWidget ketik saja shortcut "stl" (Jika menggunakan VScode)
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // -> MaterialApp adalah sebuah rangka (contoh rangka kayu untuk kanvas)
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // -> Scaffold adalah sebuah kanvas-nya
        // backgroundColor: Colors.red,
        body: Center(
          child: Text("Hello World"),
        ),
      ),
    );
  }
}
