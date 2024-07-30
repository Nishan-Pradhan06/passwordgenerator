import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:randowmpasswordgenerator/core/colors/colors.dart';

class ClipboardProvider with ChangeNotifier {
  void copyToClipboard(BuildContext context, String text) {
    try {
      Clipboard.setData(ClipboardData(text: text));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Copied to clipboard',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: BrandColors.kStrong,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Failed to copy',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: BrandColors.kLow,
        ),
      );
    }
    notifyListeners();
  }
}
