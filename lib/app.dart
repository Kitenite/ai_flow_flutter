import 'package:ai_flow/resources/constants.dart';
import 'package:flutter/material.dart';
import 'package:ai_flow/components/create_screen/create_screen.dart';
import 'package:ai_flow/components/home_screen/home_screen.dart';
import 'package:ai_flow/components/wait_screen/wait_screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({
    super.key,
    required this.initialRoute,
  });
  final String initialRoute;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ai Flow',
      initialRoute: initialRoute,
      routes: {
        Constants.waitRoute: (context) => const WaitScreen(),
        Constants.homeRoute: (context) => const HomeScreen(),
        Constants.createRoute: (context) => const CreateScreen(),
      },
      debugShowCheckedModeBanner: false,
      // TODO: Add custom theme
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.light,
    );
  }
}
