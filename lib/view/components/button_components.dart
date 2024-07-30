import 'package:flutter/material.dart';
import '../../core/colors/colors.dart';

class ButtonComponents extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final double iconSize;

  const ButtonComponents({
    Key? key,
    required this.icon,
    required this.label,
    required this.onPressed,
    this.iconSize = 24.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: iconSize == 28.0 ? 50 : 80,
          width: iconSize == 24.0 ? 50 : 80,
          decoration: const BoxDecoration(
            color: BrandColors.kSecondary,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: IconButton(
              onPressed: onPressed,
              icon: Icon(
                icon,
                color: Colors.white,
                size: iconSize,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: BrandColors.kSecondary,
          ),
        ),
      ],
    );
  }
}
