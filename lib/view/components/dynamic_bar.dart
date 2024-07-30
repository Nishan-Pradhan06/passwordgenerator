import 'package:flutter/material.dart';

class DynamicBarComponents extends StatelessWidget {
  final Color color;
  const DynamicBarComponents({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 7,
      width: 110,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
