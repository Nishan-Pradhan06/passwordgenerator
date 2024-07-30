import 'dart:math';

import 'package:flutter/material.dart';

class OnGeneratePassword extends ChangeNotifier {
  String ?text;
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
    chars += numbers;
    chars += specialCharacters;
    return List.generate(length, (index) {
      final indextRandom = Random.secure().nextInt(chars.length);
      return chars[indextRandom];
    }).join('');
  }
}
