// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:randowmpasswordgenerator/core/theme/colors.dart';
import 'package:randowmpasswordgenerator/home/presentation/main_home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:randowmpasswordgenerator/home/model/content_model.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentIndex = 0;
  final controller = PageController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Column(
                  children: [
                    Image.asset(
                      contents[i].image,
                      height: 600,
                      // cacheHeight: 1000,
                    ),
                  ],
                );
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 30),
            height: 20,
            child: SmoothPageIndicator(
              controller: controller,
              count: 2,
              effect: const WormEffect(activeDotColor: BrandColors.kSecondary),
              onDotClicked: (index) => controller.animateToPage(index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: GestureDetector(
              onTap: () async {
                final prefs = await SharedPreferences.getInstance();
                prefs.setBool('showHome', true);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 60),
                height: 45,
                width: double.infinity,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    color: BrandColors.kSecondary),
                child: const Center(
                  child: Text(
                    'Continue',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
