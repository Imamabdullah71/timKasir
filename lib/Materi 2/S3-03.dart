import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // SingleChildScrollView

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 7, 44, 255),
          title: const Text("timKasir"),
        ),
        body: GridView(
          // padding: EdgeInsets.all(
          //   10,
          // ),
          // gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          //   maxCrossAxisExtent: 200, <-[200px]
          // ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            crossAxisSpacing: 5, // <- Spacing antar kotak vertical
            mainAxisSpacing: 5, // <- Spacing antar kotak horizontal
          ),
          children: [
            Container(
              color: Colors.amber,
            ),
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.blue,
            ),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.pink,
            ),
            Container(
              color: Colors.grey,
            ),
            Container(
              color: Colors.lightBlue,
            ),
            Container(
              color: Colors.brown,
            ),
            Container(
              color: Colors.yellow,
            ),
          ],
        ),
      ),
    );
  }
}

/* Invisible
& Visible Widget(Layouting Widget):
- Center  
- Column -> vertikal(atas bawah)
- Row -> horizontal(kiri kanan)
- Stack -> Menumpuk(depan belakang) Widget(Container Misalnya)
- SingleChildScrollView -> 
- ListView
- GridView
 */
