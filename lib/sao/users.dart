import 'package:ai_flow/models/user.dart';
import 'package:ai_flow/resources/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDataAccessor {
  static Future<String?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString(userIdPreference);
    return userId;
  }

  static Future<User> createNewUser() async {
    final prefs = await SharedPreferences.getInstance();
    User newUser = User();
    await prefs.setString(userIdPreference, newUser.id);
    // Save user in firestore
    FirebaseFirestore.instance
        .collection(usersCollectionId)
        .add(newUser.toJson())
        .then(
          (DocumentReference doc) =>
              print('New user added to DB with ID: ${doc.id}'),
        );
    return newUser;
  }

  // We might want a stream instead
  // Future<User> fetchUser(String userId) async {
  //   FirebaseFirestore db = FirebaseFirestore.instance;

  //   final docRef = db.collection(firebaseUserCollection).doc(userId);
  //   docRef.get().then(
  //     (DocumentSnapshot doc) {
  //       final data = doc.data() as Map<String, dynamic>;
  //       return data;
  //     },
  //     onError: (e) => print("Error getting document: $e"),
  //   );
  // }
}
