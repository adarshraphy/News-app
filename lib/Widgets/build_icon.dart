import 'package:flutter/widgets.dart';

class BuildIcon extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color color;

  const BuildIcon(
      {super.key, required this.icon, required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: size,
      color: color,
    );
  }
}
