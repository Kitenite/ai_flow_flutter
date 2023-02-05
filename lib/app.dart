import 'package:ai_flow/resources/constants.dart';
import 'package:flutter/material.dart';
import 'package:ai_flow/components/create_screen/create_screen.dart';
import 'package:ai_flow/components/home_screen/home_screen.dart';
import 'package:ai_flow/components/run_screen/run_screen.dart';
import 'package:ai_flow/components/wait_screen/wait_screen.dart';
import 'package:ai_flow/models/applet.dart';

List<Applet> marketplaceApplets = [
  Applet(
      name: "Vegan ingredients",
      prompt:
          "Look at this list of recipes. For each ingredient, explain the ingredients in 1-2 sentences and say if they are vegan. Then at the end, say whether all the ingredients are vegan or not vegan: ",
      description:
          "Takes a list of ingredients and say whether or not it's vegan",
      inputType: InputType.text,
      outputType: OutputType.text,
      inputPrompt: "Add your list of ingredients here"),
];

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
        Constants.runRoute: (context) => RunScreen(
              applet: marketplaceApplets.first,
            ),
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
