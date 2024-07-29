import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/shared_preference_provider.dart';
import 'onboarding_screen.dart';

class HomePages extends StatelessWidget {
  const HomePages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        backgroundColor: Colors.lightBlue,
        leading: Consumer<PreferencesProvider>(
          builder: (context, prefProvider, child) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_rounded),
              onPressed: () async {
                prefProvider.setShowHome(false);
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const OnBoarding(),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
