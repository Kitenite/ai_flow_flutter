import 'package:ai_flow/create_screen/create_screen.dart';
import 'package:ai_flow/home_screen/home_screen.dart';
import 'package:ai_flow/models/applet.dart';
import 'package:ai_flow/models/user.dart';
import 'package:ai_flow/run_screen/run_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

// Routes
const String homeRoute = "/home";
const String createRoute = "/create";
const String runRoute = "/run";
// Data
const String userIdPreference = "user_id";
const String firebaseUserCollection = "users";

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
  final prefs = await SharedPreferences.getInstance();

  // TODO: Remove
  // await prefs.remove(userIdPreference);
  String? userId = prefs.getString(userIdPreference);

  // If no user, create a user
  if (userId == null) {
    User newUser = User();
    await prefs.setString(userIdPreference, newUser.id);
    // Save user in firestore
    FirebaseFirestore.instance
        .collection(firebaseUserCollection)
        .add(newUser.toJson())
        .then(
          (DocumentReference doc) => print('New user added with ID: ${doc.id}'),
        );
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
