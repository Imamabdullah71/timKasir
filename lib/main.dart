import 'package:flutter/material.dart';

void main() {
  runApp(Nova());
}

class Nova extends StatelessWidget {
  const Nova({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Nimbus(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Nimbus extends StatefulWidget {
  const Nimbus({super.key});

  @override
  State<Nimbus> createState() => _NimbusState();
}

class _NimbusState extends State<Nimbus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("data",
        style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: ,
    );
  }
}
