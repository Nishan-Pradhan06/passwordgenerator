import 'package:flutter/material.dart';
import '../../core/colors/colors.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: MediaQuery.of(context).size.height / 4.5,
        width: double.infinity,
        decoration: const BoxDecoration(
            color: BrandColors.kSecondary,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: const Center(
          child: Padding(
            padding: EdgeInsets.all(50.0),
            // child: TextField(
            //   controller: controller,
            //   readOnly: true,
            //   enableInteractiveSelection: false,
            //   decoration: const InputDecoration(
            //     border: InputBorder.none,
            //     labelStyle: TextStyle(
            //         fontSize: 30,
            //         color: Colors.white,
            //         fontWeight: FontWeight.bold),
            //   ),
            // ),
            child: Text(
              "dasdasdas",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
