// ignore_for_file: unnecessary_string_interpolations

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:randowmpasswordgenerator/core/colors/colors.dart';
import 'package:randowmpasswordgenerator/view/pages/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/password_field.dart';

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
            // ignore: use_build_context_synchronously
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const OnBoarding(),
              ),
            );
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
          PasswordField(),
          SizedBox(
            height: 10.0,
          ),
          DyanamicBar(),
          SizedBox(
            height: 10.0,
          ),
          ButtonSelect(),
          SizedBox(
            height: 10.0,
          ),
          OnclickButtons(),
        ],
      ),
    );
  }
}
//Buttons

class OnclickButtons extends StatefulWidget {
  const OnclickButtons({
    super.key,
  });

  @override
  State<OnclickButtons> createState() => _OnclickButtonsState();
}

class _OnclickButtonsState extends State<OnclickButtons> {
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

//selection Button
class ButtonSelect extends StatefulWidget {
  const ButtonSelect({
    super.key,
  });

  @override
  State<ButtonSelect> createState() => _ButtonSelectState();
}

class _ButtonSelectState extends State<ButtonSelect> {
  // int selectedContainerIndex = 0;
  Map<String, bool> selectedContainerIndex = {
    '123': true,
    'ABC': false,
    '@#!': false
  };
  // bool _isSettingEnabled = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Wrap(
        spacing: 12.0,
        runSpacing: 10.0,
        children: [
          _buildStatusContainer('Digits', '123'),
          _buildStatusContainer('Characters', 'ABC'),
          _buildStatusContainer('Symbols', '@#!'),
        ],
      ),
    );
  }

  Container _buildStatusContainer(String labelText, String centerText) {
    // ignore: no_leading_underscores_for_local_identifiers
    bool _isSettingEnabled = selectedContainerIndex[centerText]!;
    return Container(
      height: 140,
      width: 170,
      decoration: BoxDecoration(
        border: _isSettingEnabled
            ? Border.all(color: Colors.transparent)
            : Border.all(color: BrandColors.kdisbleColor),
        borderRadius: BorderRadius.circular(20),
        color: _isSettingEnabled ? BrandColors.kSecondary : Colors.white,
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 75, top: 12),
                height: 45,
                width: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: _isSettingEnabled
                      ? BrandColors.kinner
                      : BrandColors.kdisbleColor,
                ),
                child: Center(
                  child: Text(
                    centerText,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Text(
                      labelText,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: _isSettingEnabled
                            ? Colors.white
                            : BrandColors.kdisbleColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Transform.scale(
                    scale: 0.89,
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return FadeTransition(
                          opacity: animation,
                          child: child,
                        );
                      },
                      child: Switch(
                        inactiveThumbColor: Colors.white,
                        trackOutlineColor: const MaterialStatePropertyAll(
                          Color(0x00ffffff),
                        ),
                        inactiveTrackColor: BrandColors.kbtndisbleColor,
                        activeTrackColor: BrandColors.kinner,
                        value: _isSettingEnabled,
                        onChanged: (bool value) {
                          setState(() {
                            // _isSettingEnabled = value;
                            selectedContainerIndex[centerText] = value;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//bar for password
class DyanamicBar extends StatefulWidget {
  const DyanamicBar({
    super.key,
  });

  @override
  State<DyanamicBar> createState() => _DyanamicBarState();
}

class _DyanamicBarState extends State<DyanamicBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildBarContainer(BrandColors.kStrong),
          const SizedBox(
            width: 20,
          ),
          _buildBarContainer(BrandColors.kStrong),
          const SizedBox(
            width: 20,
          ),
          _buildBarContainer(BrandColors.kStrong),
        ],
      ),
    );
  }

  Widget _buildBarContainer(Color color) {
    return Container(
      margin: const EdgeInsets.all(2),
      height: 5,
      width: 100,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}

//textfield

class TextGeneratedField extends StatefulWidget {
  const TextGeneratedField({Key? key}) : super(key: key);

  @override
  State<TextGeneratedField> createState() => _TextGeneratedFieldState();
}

class _TextGeneratedFieldState extends State<TextGeneratedField> {
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
            ),
          ),
        ),
      ),
    );
  }
}
