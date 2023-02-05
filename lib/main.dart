import 'package:ai_flow/app.dart';
import 'package:ai_flow/models/user.dart';
import 'package:ai_flow/resources/constants.dart';
import 'package:ai_flow/sao/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void setupFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore db = FirebaseFirestore.instance;
  // Allow offline access to database
  if (kIsWeb) {
    await db
        .enablePersistence(const PersistenceSettings(synchronizeTabs: true));
  } else {
    db.settings = const Settings(persistenceEnabled: true); // iOS and Android
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupFirebase();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: UserDataAccessor.getUserId(),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        // Set up data providers and initial route
        if (snapshot.hasData) {
          return MultiProvider(
            providers: [
              StreamProvider<User>(
                create: (BuildContext context) =>
                    UserDataAccessor.streamUser(snapshot.data!),
                initialData: User(),
              ),
            ],
            child: const MainApp(initialRoute: Constants.homeRoute),
          );
        }
        return const MainApp(initialRoute: Constants.waitRoute);
      },
    );
  }
}
