import 'package:flutter/material.dart';


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
        body: ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: 20,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.bottomLeft,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  20,
                ),
                color: Colors.grey[300],
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "https://picsum.photos/id/${777 + index}/200/300",
                  ),
                ),
              ),
              child: Text(
                "Testing ${index + 1}",
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
