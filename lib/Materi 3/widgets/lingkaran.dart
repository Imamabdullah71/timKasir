
import 'package:flutter/material.dart';

class lingkaran extends StatelessWidget {
  const lingkaran({
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
        // Bisa Menggunakan ClipOval() jika ingin membuat Lingkaran
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.lightBlue,
            borderRadius: BorderRadius.circular(200),
          ),
          child: const Center(
            child: Text(
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
              "Lingkaran",
            ),
          ),
        ),
      ),
    );
  }
}
