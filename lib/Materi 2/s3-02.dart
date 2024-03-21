import 'package:flutter/material.dart';

void main() {
  runApp(const BebasApp());
}

class BebasApp extends StatelessWidget {
  const BebasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: const Color.fromARGB(255, 192, 192, 192),
          appBar: AppBar(
            backgroundColor: Colors.pink,
            centerTitle: true,
            title: const Text("Aplikasi Pertama"),
          ),
          body: Center( 
            child: Image.asset("assets/images.jpg"),
          )),
    );
  }
}

// Image Provider :
// 1. Asset Image -> gambar yang ada pada folder project -> perlu daftar di pubspec.yaml
// 2. Network Image
//    -> Mengambil dari internet
//    -> Aplikasi butuh koneksi internet
// Jarang digunakan -> pada kasus tertentu
// 3. File Image
// 4. Memory Image

/* Widget Dasar
- MaterialApp
- Scaffold
- AppBar
- Container
- Text
- FlutterLogo
- ElevatedButton
- Icon
- Image
 */