import 'package:ai_flow/create_screen/create_screen.dart';
import 'package:ai_flow/home_screen/home_screen.dart';
import 'package:ai_flow/run_screen/run_screen.dart';
import 'package:flutter/material.dart';

const String homeRoute = "/home";
const String createRoute = "/create";
const String runRoute = "/run";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ai Flow',
      initialRoute: homeRoute,
      routes: {
        homeRoute: (context) => const HomePage(),
        createRoute: (context) => const CreateScreen(),
        runRoute: (context) => RunScreen(
              applet: Applet(
                  name: "Vegan ingredients",
                  prompt:
                      "Look at this list of recipes. For each ingredient, explain the ingredients in 1-2 sentences and say if they are vegan. Then at the end, say whether all the ingredients are vegan or not vegan: ",
                  description:
                      "Takes a list of ingredients and say whether or not it's vegan",
                  inputType: InputType.text,
                  outputType: OutputType.text,
                  inputPrompt: "Add your list of ingredients here"),
            ),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        /* light theme settings */
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        /* dark theme settings */
      ),
      themeMode: ThemeMode.light,
    );
  }
}
