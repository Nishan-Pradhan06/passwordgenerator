import 'package:flutter/material.dart';
import 'package:randowmpasswordgenerator/core/theme/colors.dart';

class PasswordContainer extends StatefulWidget {
  const PasswordContainer({super.key});

  @override
  State<PasswordContainer> createState() => _PasswordContainerState();
}

class _PasswordContainerState extends State<PasswordContainer> {
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
            child: Text(
          'asdionOAWIDfodaa',
          style: TextStyle(
              fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
