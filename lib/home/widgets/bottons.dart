import 'package:flutter/material.dart';
import 'package:randowmpasswordgenerator/core/theme/colors.dart';
import 'package:randowmpasswordgenerator/home/presentation/onboarding_screen.dart';

class BottonButtons extends StatefulWidget {
  const BottonButtons({super.key});

  @override
  State<BottonButtons> createState() => _BottonButtonsState();
}

class _BottonButtonsState extends State<BottonButtons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 45),
      child: Row(
        // mainAxisSize: MainAxisSize.m,s
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                    color: BrandColors.kSecondary, shape: BoxShape.circle),
                child: Center(
                  child: Stack(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.copy_sharp,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                'Copy',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: BrandColors.kSecondary),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: const BoxDecoration(
                    color: BrandColors.kSecondary, shape: BoxShape.circle),
                child: Center(
                  child: Stack(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.generating_tokens_rounded,
                          color: Colors.white,
                          size: 35,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                'Generate',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: BrandColors.kSecondary),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                    color: BrandColors.kSecondary, shape: BoxShape.circle),
                child: Center(
                  child: Stack(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const OnBoarding()));
                        },
                        icon: const Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                'Back',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: BrandColors.kSecondary),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
