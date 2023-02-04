import 'package:ai_flow/models/user.dart';
import 'package:ai_flow/resources/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDataAccessor {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static Future<String?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString(Constants.userIdPreference);
    return userId;
  }

  static Future<User> createNewUser() async {
    final prefs = await SharedPreferences.getInstance();
    User newUser = User();
    await prefs.setString(Constants.userIdPreference, newUser.id);
    FirebaseFirestore.instance
        .collection(Constants.usersCollectionId)
        .add(newUser.toJson())
        .then(
          (DocumentReference doc) =>
              print('New user added to DB with ID: ${doc.id}'),
        );
    return newUser;
  }

  static Stream<User> streamUser(String id) {
    return _db.collection(Constants.usersCollectionId).doc(id).snapshots().map(
        (snapshot) => User.fromJson(snapshot.data as Map<String, dynamic>));
  }
}
