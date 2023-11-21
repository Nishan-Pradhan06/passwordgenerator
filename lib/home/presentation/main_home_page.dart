import 'package:flutter/material.dart';
import 'package:randowmpasswordgenerator/core/theme/colors.dart';
import 'package:randowmpasswordgenerator/home/widgets/bar.dart';
import 'package:randowmpasswordgenerator/home/widgets/menu.dart';
import 'package:randowmpasswordgenerator/home/widgets/password_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        // elevation: 10,
        centerTitle: true,
        title: const Text(
          'Generated Password',
          style: TextStyle(),
        ),
      ),
      backgroundColor: BrandColors.kBackground,
      body: const Column(
        children: [
          PasswordContainer(),
          SizedBox(
            height: 5.0,
          ),
          BarContainer(),
          SizedBox(
            height: 5.0,
          ),
          SelectionMenu(),
          SizedBox(
            height: 5.0,
          ),
        ],
      ),
    );
  }
}
