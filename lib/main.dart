import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:randowmpasswordgenerator/view/pages/home_page.dart';
import 'package:randowmpasswordgenerator/view/pages/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'controller/onboarding_provider.dart';
import 'controller/password_provider.dart';
import 'controller/selection_card_provider.dart';
import 'controller/shared_preference_provider.dart';

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
        ChangeNotifierProvider(create: (_)=>OnGeneratePassword()),
        ChangeNotifierProvider(create: (_)=> PreferencesProvider()),
        ChangeNotifierProvider(create: (_)=> SelectionCardProvider()),
      ],
      child: MaterialApp(
        title: 'Password Generator',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: showHome ? const HomePages() : const OnBoarding(),
      ),
    );
  }
}
