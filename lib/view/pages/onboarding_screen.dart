// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:randowmpasswordgenerator/view/pages/home_e.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../controller/onboarding_provider.dart';
import '../../controller/shared_preference_provider.dart';
import '../../core/colors/colors.dart';
import '../../core/constants/onboarding_const.dart';
import 'home_page.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<OnboardingProvider>(
        builder: (context, onboardProvider, child) {
          return Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: onboardProvider.pageController,
                  itemCount: contents.length,
                  onPageChanged: (int index) {
                    onboardProvider.setPageIndex(index);
                  },
                  itemBuilder: (_, i) {
                    return Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 200),
                          child: Image.asset(
                            contents[i].image,
                            alignment: Alignment.center,
                          ),
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
                  controller: onboardProvider.pageController,
                  count: 2,
                  effect:
                      const WormEffect(activeDotColor: BrandColors.kSecondary),
                  onDotClicked: (index) => onboardProvider.pageController
                      .animateToPage(index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Consumer<PreferencesProvider>(
                  builder: (context, prefProvider, child) {
                    return GestureDetector(
                      onTap: () async {
                        prefProvider.setShowHome(true);
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
                    );
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
