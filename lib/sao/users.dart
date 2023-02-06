import 'package:ai_flow/models/collection.dart';
import 'package:ai_flow/models/user.dart';
import 'package:ai_flow/resources/constants.dart';
import 'package:ai_flow/sao/collections.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDataAccessor {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static Future<String> getUserId() async {
    // TODO: For testing, refresh user. Remove this later
    // final prefs = await SharedPreferences.getInstance();
    // prefs.remove(Constants.userIdPreference);

    // TODO: Use user ID from firebase auth instead of shared preference (local storage)
    String? userId = await getLocalUserId();

    if (userId == null) {
      User newUser = await createNewUser();
      saveLocalUserId(newUser.id);
      userId = newUser.id;
    }

    return userId;
  }

  static Future<String?> getLocalUserId() async {
    final prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString(Constants.userIdPreference);
    return userId;
  }

  static void saveLocalUserId(String id) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(Constants.userIdPreference, id);
  }

  static Future<User> createNewUser() async {
    User newUser = User();

    // Add default collections to user
    Collection newCollection = Collection(name: "My Apps");
    CollectionDataAccessor.createNewCollection(newCollection);
    newUser.addCollectionId(newCollection.id);
    newUser.addCollectionId(Constants.marketplaceCollectionId);

    // Save in db
    FirebaseFirestore.instance
        .collection(Constants.usersCollectionId)
        .doc(newUser.id)
        .set(newUser.toJson())
        .then((value) => print('Added user with ID: ${newUser.id}'));

    return newUser;
  }

  static Stream<User> streamUser(String id) {
    return _db
        .collection(Constants.usersCollectionId)
        .doc(id)
        .snapshots()
        .map((snapshot) => User.fromJson(snapshot.data()!));
  }

  static void updateUser(User user) {
    FirebaseFirestore.instance
        .collection(Constants.usersCollectionId)
        .doc(user.id)
        .set(user.toJson())
        .then((value) => print('Updated user with ID: ${user.id}'));
  }

  static addCollectionToUser() {}
}
