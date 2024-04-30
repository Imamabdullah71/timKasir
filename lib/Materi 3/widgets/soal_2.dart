import 'dart:math';

import 'package:flutter/material.dart';

class Soal2 extends StatelessWidget {
  const Soal2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        leading: const FlutterLogo(),
        title: const Text("timKasir"),
        actions: [
          IconButton(
            onPressed: () {
              print("Next");
            },
            icon: const Icon(
              Icons.more_vert,
            ),
          ),
        ],
      ),
      body: Center(
        // child: Transform.flip(
        //   flipX: true,
        //   child: const Text('Horizontal Flip'),
        // ),
        child: Transform.rotate(
          angle: pi /
              (180 /
                  90), // <- Rotasi 90⁰ , jika ingin 70⁰ maka -> angle: pi / (180 / 70) dst.
          child: Container(
            padding: const EdgeInsets.all(8.0),
            color: const Color(0xFFE8581C),
            child: const Text('ROTASI PADA WIDGET'),
          ),
        ),
      ),
    );
  }
}
