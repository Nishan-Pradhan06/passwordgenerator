import 'dart:math';
import 'package:flutter/material.dart';

class OnGeneratePassword extends ChangeNotifier {
  String? text;

  String generatePassword({
    bool hasLetters = true,
    bool hasNumbers = true,
    bool hasSpecial = true,
  }) {
    const length = 12;
    const letterLowercase = 'abcdefghijklmnopqrstuvwxyz';
    const lettersUppercase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const numbers = '0123456789';
    const specialCharacters = '!@#\$%^&*()';

    String chars = '';
    if (hasLetters) chars += '$lettersUppercase$letterLowercase';
    if (hasNumbers) chars += numbers;
    if (hasSpecial) chars += specialCharacters;

    if (chars.isEmpty) return '';

    return List.generate(length, (index) {
      final indexRandom = Random.secure().nextInt(chars.length);
      return chars[indexRandom];
    }).join('');
  }

  void updatePassword(String newText) {
    text = newText;
    notifyListeners();
  }
}
