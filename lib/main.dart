import 'package:ai_flow/components/create_screen/create_screen.dart';
import 'package:ai_flow/components/home_screen/home_screen.dart';
import 'package:ai_flow/components/run_screen/run_screen.dart';
import 'package:ai_flow/models/applet.dart';
import 'package:ai_flow/resources/constants.dart';
import 'package:ai_flow/sao/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

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

void setupFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  var db = FirebaseFirestore.instance;
  // Allow offline access to database
  if (kIsWeb) {
    await db
        .enablePersistence(const PersistenceSettings(synchronizeTabs: true));
  } else {
    db.settings = const Settings(persistenceEnabled: true); // iOS and Android
  }
}

void setupUser() async {
  // TODO: Use user ID from firebase auth instead of shared preference (local storage)
  String? userId = await getUserId();

  if (userId == null) {
    createNewUser();
  } else {
    print("User found $userId");
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupFirebase();
  setupUser();
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
        homeRoute: (context) => const HomeScreen(),
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
                inputPrompt: "Add your list of ingredients here",
                outputPrompt: "Here's the result of your call",
              ),
            ),
      },
      debugShowCheckedModeBanner: false,
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
