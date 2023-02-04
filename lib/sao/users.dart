import 'package:ai_flow/models/user.dart';
import 'package:ai_flow/resources/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<String?> getUserId() async {
  final prefs = await SharedPreferences.getInstance();
  String? userId = prefs.getString(userIdPreference);
  return userId;
}

Future<User> createNewUser() async {
  final prefs = await SharedPreferences.getInstance();
  User newUser = User();
  await prefs.setString(userIdPreference, newUser.id);
  // Save user in firestore
  FirebaseFirestore.instance
      .collection(firebaseUserCollection)
      .add(newUser.toJson())
      .then(
        (DocumentReference doc) =>
            print('New user added to DB with ID: ${doc.id}'),
      );
  return newUser;
}

// Future<User> fetchUser(String userId) async {
//   final docRef = db.collection("cities").doc("SF");
//   docRef.get().then(
//     (DocumentSnapshot doc) {
//       final data = doc.data() as Map<String, dynamic>;
//       // ...
//     },
//     onError: (e) => print("Error getting document: $e"),
//   );
// }
