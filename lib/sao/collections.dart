import 'package:ai_flow/models/collection.dart';
import 'package:ai_flow/resources/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CollectionDataAccessor {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static Future<Collection> createNewCollection(
      Collection newCollection) async {
    // Save collection in firestore
    FirebaseFirestore.instance
        .collection(Constants.collectionsCollectionId)
        .doc(newCollection.id)
        .set(newCollection.toJson())
        .then((_) =>
            print('New collection added to DB with ID: ${newCollection.id}'));

    return newCollection;
  }

  static Stream<Collection> streamCollection(String id) {
    return _db
        .collection(Constants.usersCollectionId)
        .doc(id)
        .snapshots()
        .map((snapshot) => Collection.fromJson(snapshot.data()!));
  }
}
