// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:randowmpasswordgenerator/core/theme/colors.dart';
import 'package:randowmpasswordgenerator/home/presentation/onboarding_screen.dart';
import 'package:randowmpasswordgenerator/home/widgets/bar.dart';
import 'package:randowmpasswordgenerator/home/widgets/menu.dart';
import 'package:randowmpasswordgenerator/home/widgets/bottons.dart';
import 'package:randowmpasswordgenerator/home/widgets/password_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
          onPressed: () async {
            final prefs = await SharedPreferences.getInstance();
            prefs.setBool('showHome', false);
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const OnBoarding()));
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
            height: 10.0,
          ),
          BarContainer(),
          SizedBox(
            height: 10.0,
          ),
          SelectionMenu(),
          SizedBox(
            height: 10.0,
          ),
          BottonButtons()
        ],
      ),
    );
  }
}
