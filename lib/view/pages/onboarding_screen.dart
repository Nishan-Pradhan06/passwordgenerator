import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Consumer<OnboardingProvider>(
        builder: (context, onboardProvider, child) {
          return Column(
            children: [
              Expanded(
                flex: 3,
                child: PageView.builder(
                  controller: onboardProvider.pageController,
                  itemCount: contents.length,
                  onPageChanged: (int index) {
                    onboardProvider.setPageIndex(index);
                  },
                  itemBuilder: (_, i) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: screenHeight * 0.1), // Adjust top margin
                          child: Image.asset(
                            contents[i].image,
                            width: screenWidth * 0.8, // Adjust width as needed
                            fit: BoxFit
                                .contain, // Ensure the image scales properly
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.02), // Adjust vertical margin
                height: 20,
                child: SmoothPageIndicator(
                  controller: onboardProvider.pageController,
                  count: contents.length,
                  effect:
                      const WormEffect(activeDotColor: BrandColors.kSecondary),
                  onDotClicked: (index) => onboardProvider.pageController
                      .animateToPage(index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.1), // Adjust horizontal padding
                child: Consumer<PreferencesProvider>(
                  builder: (context, prefProvider, child) {
                    return GestureDetector(
                      onTap: () async {
                        prefProvider.setShowHome(true);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const HomePages(),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            bottom:
                                screenHeight * 0.05), // Adjust bottom margin
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
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
