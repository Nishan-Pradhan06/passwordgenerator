import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:randowmpasswordgenerator/home/presentation/main_home_page.dart';
// import 'package:randowmpasswordgenerator/core/theme/colors.dart';
// import 'package:randowmpasswordgenerator/home/presentation/main_home_page.dart';
import 'package:randowmpasswordgenerator/view/pages/onboarding_screen.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'controller/onboarding_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;
  runApp(MyApp(showHome: showHome));
}

class MyApp extends StatelessWidget {
  final bool showHome;
  const MyApp({
    Key? key,
    required this.showHome,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OnboardingProvider()),
      ],
      child: MaterialApp(
        title: 'Password Generator',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: showHome ? const HomePage() : const OnBoarding(),
      ),
    );
  }
}
