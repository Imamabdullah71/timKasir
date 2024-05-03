import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';

void main() {
  runApp(Glyph());
}

class Glyph extends StatelessWidget {
  const Glyph({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Cascade(),
    );
  }
}

class Cascade extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Avatar Glow",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
      ),
      body: Center(
        child: AvatarGlow(
          animate: true,
          glowRadiusFactor: 0.7,
          glowCount: 1,
          // glowRadiusFactor: 10.0,
          glowColor: Colors.blue,
          duration: Duration(milliseconds: 2000),
          repeat: true,
          startDelay: Duration(milliseconds: 100),
          child: Material(
            elevation: 5.0,

            shape: CircleBorder(),
            child: CircleAvatar(
              backgroundImage: NetworkImage("https://picsum.photos/200"),
              backgroundColor: Colors.grey[100],
              // child: Image.network(
              //     'https://picsum.photos/200/300.jpg',
              //     height: 50,
              // ),
              radius: 60.0,
            ),
          ),
        ),
      ),
    );
  }
}
