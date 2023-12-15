import 'package:flutter/material.dart';
import 'package:pharmacy_app/init/init.dart';
import 'package:pharmacy_app/feature/controllers/map_controller.dart';
import 'package:pharmacy_app/feature/controllers/state_controller.dart';
import 'package:pharmacy_app/themes/dark_theme.dart';
import 'package:pharmacy_app/feature/views/splash_screen.dart';
import 'package:pharmacy_app/themes/light_theme.dart';
import 'package:provider/provider.dart';

void main() async {
  await initializeApp(); 
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => StateController()),
      ChangeNotifierProvider(create: (context) => MapController())
    ],
    child: const MyApp(),
  ));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: darkTheme,
      theme: lightTheme,
      // themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
