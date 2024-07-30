import 'package:flutter/material.dart';

class DynamicBarComponents extends StatelessWidget {
  final Color color;
  const DynamicBarComponents({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2),
      height: 5,
      width: 100,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
