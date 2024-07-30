import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/password_provider.dart';
import '../../core/colors/colors.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // Define proportional height and width for the container
    final containerHeight = screenHeight * 0.2; // 20% of the screen height
    final containerPadding = screenWidth * 0.05; // 5% of the screen width
    final textSize = screenWidth * 0.06; // Adjust text size proportionally

    return Container(
      height: containerHeight,
      width: double.infinity,
      decoration: BoxDecoration(
        color: BrandColors.kSecondary,
        borderRadius: BorderRadius.all(
            Radius.circular(screenWidth * 0.05)), // 5% of screen width
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(containerPadding),
          child: Consumer<OnGeneratePassword>(
            builder: (context, passwordProvider, child) {
              return Text(
                passwordProvider.text ?? "No Password",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: textSize,
                ),
                textAlign: TextAlign.center,
              );
            },
          ),
        ),
      ),
    );
  }
}
