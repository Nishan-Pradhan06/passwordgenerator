import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:randowmpasswordgenerator/core/colors/colors.dart';
import '../../controller/shared_preference_provider.dart';
import '../pages/onboarding_screen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 8.0,
      foregroundColor: Colors.black,
      backgroundColor: BrandColors.kSecondary,
      scrolledUnderElevation: 6.0,
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
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      centerTitle: true,
      title: const Text(
        'Generated Password',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
