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
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonSize =
        screenWidth * 0.14; // Adjust the button size proportionally
    final textSize = screenWidth * 0.04; // Adjust the text size proportionally

    return Column(
      children: [
        Container(
          height: buttonSize,
          width: buttonSize,
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
                size: iconSize, // Adjust icon size if necessary
              ),
            ),
          ),
        ),
        SizedBox(height: screenWidth * 0.02),
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: BrandColors.kSecondary,
            fontSize: textSize, // Adjust text size proportionally
          ),
        ),
      ],
    );
  }
}
