import 'package:flutter/material.dart';
// import 'package:randowmpasswordgenerator/core/theme/colors.dart';
import 'package:randowmpasswordgenerator/home/presentation/main_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Password Generator',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(
      //     background: BrandColors.kBackground,
      //     seedColor: Colors.white,
      //   ),
      //   useMaterial3: true,
      // ),
      
      home:  HomePage(),
    );
  }
}
