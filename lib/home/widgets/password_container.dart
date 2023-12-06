import 'package:flutter/material.dart';
import 'package:randowmpasswordgenerator/core/theme/colors.dart';

class PasswordContainer extends StatefulWidget {
  // final void Function(String) onGenreatePassword; //adadded
  const PasswordContainer({super.key});

  @override
  State<PasswordContainer> createState() => _PasswordContainerState();
}

class _PasswordContainerState extends State<PasswordContainer> {
  final controller = TextEditingController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
                "dfS6IOF@!D4",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 30),
              )),
        ),
      ),
    );
  }
}
