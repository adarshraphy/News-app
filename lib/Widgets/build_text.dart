import 'package:flutter/material.dart';

class BuildText extends StatelessWidget {
  final String text1;
  final Color color;
  final FontWeight weight;
  final double size;

  const BuildText(
      {super.key,
      required this.text1,
      required this.color,
      required this.weight,
      required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
      text1,
      style: TextStyle(color: color, fontWeight: weight, fontSize: size),
    );
  }
}
