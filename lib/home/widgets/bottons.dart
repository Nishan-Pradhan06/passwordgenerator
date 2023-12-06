// ignore_for_file: unnecessary_string_interpolations

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:randowmpasswordgenerator/core/theme/colors.dart';
import 'package:randowmpasswordgenerator/home/presentation/onboarding_screen.dart';

class BottonButtons extends StatefulWidget {
  const BottonButtons({super.key});

  @override
  State<BottonButtons> createState() => _BottonButtonsState();
}

class _BottonButtonsState extends State<BottonButtons> {
  Widget customButton(
    IconData icon,
    String label,
    VoidCallback onPressed, {
    double iconSize = 24.0,
  }) {
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
            child: Stack(
              children: [
                IconButton(
                  onPressed: onPressed,
                  icon: Icon(
                    icon,
                    color: Colors.white,
                    size: iconSize,
                  ),
                )
              ],
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

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 45),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          customButton(
            Icons.copy_sharp,
            'Copy',
            () {},
          ),
          customButton(
            Icons.generating_tokens_rounded,
            'Generate',
            () {
              // final password = generatePassword();
              // controller.text = password;
            },
            iconSize: 40.0,
          ),
          customButton(
            Icons.arrow_back_rounded,
            'Back',
            () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const OnBoarding(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  String generatePassword({
    bool hasLetters = true,
    bool hasNumbers = true,
    bool hasSpecial = true,
  }) {
    const length = 20;
    const letterLowercase = 'abcdefghijklmnopqrstuvwxyz';
    const lettersUppercase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const numbers = '0123456789';
    const specialCharacters = '!@#\$%^&*()';

    String chars = '';
    chars += '$lettersUppercase$letterLowercase';
    chars += '$numbers';
    chars += '$specialCharacters';
    return List.generate(length, (index) {
      final indextRandom = Random.secure().nextInt(chars.length);
      return chars[indextRandom];
    }).join('');
  }
}
