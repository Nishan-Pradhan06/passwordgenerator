import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/password_provider.dart';
import '../../core/colors/colors.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 4.5,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: BrandColors.kSecondary,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Consumer<OnGeneratePassword>(
            builder: (context, passwordProvider, child) {
              return Text(
                passwordProvider.text ?? "No Password",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 30,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
