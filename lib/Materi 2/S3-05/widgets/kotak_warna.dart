import 'package:flutter/material.dart';

// Extract widget -> reusable widget
class KotakWarna extends StatelessWidget {
  const KotakWarna({
    super.key,
    required this.text,
    required this.warna,
  });

  final String text;
  final Color warna;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      color: warna,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}