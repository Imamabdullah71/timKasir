import 'package:flutter/material.dart';


class Soal1 extends StatelessWidget {
  const Soal1({
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
        child: Container(
          height: 200,
          width: 200,
          color: Colors.amber,
          child: const Center(
            child: Text(
              "Data",
              style: TextStyle(
                fontSize: 30, // UKURAN HURUF
                fontWeight: FontWeight.bold, // BOLD
                fontStyle: FontStyle.italic, // ITALIC
                decoration: TextDecoration.underline, // UNDERLINE
              ),
            ),
          ),
        ),
      ),
    );
  }
}
