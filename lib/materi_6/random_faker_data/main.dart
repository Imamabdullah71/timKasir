import 'package:flutter/material.dart';
import './pages/kontruksi.dart';

void main() {
  runApp(ApkFlutter());
}

class ApkFlutter extends StatelessWidget {
  const ApkFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Kontruksi(),
    );
  }
}

