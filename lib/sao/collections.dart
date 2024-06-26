import 'package:ai_flow/models/collection.dart';
import 'package:ai_flow/resources/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CollectionDataAccessor {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static Future<Collection> createNewCollection(
      Collection newCollection) async {
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
        .collection(Constants.collectionsCollectionId)
        .doc(id)
        .snapshots()
        .map(
      (snapshot) {
        if (snapshot.exists) {
          return Collection.fromJson(snapshot.data()!);
        } else {
          return Collection(name: "Loading...");
        }
      },
    );
  }

  static Future<Collection> getCollection(String id) {
    return _db
        .collection(Constants.collectionsCollectionId)
        .doc(id)
        .get()
        .then((value) => Collection.fromJson(value.data()!));
  }

  static void updateCollection(Collection collection) {
    FirebaseFirestore.instance
        .collection(Constants.collectionsCollectionId)
        .doc(collection.id)
        .set(collection.toJson())
        .then((_) =>
            print('New collection added to DB with ID: ${collection.id}'));
  }

  static void addAppletToCollection(
      String collectionId, String appletId) async {
    Collection oldCollection = await getCollection(collectionId);
    List<String> newIdList = [...oldCollection.appletIds, appletId];
    FirebaseFirestore.instance
        .collection(Constants.collectionsCollectionId)
        .doc(collectionId)
        .update({"appletIds": newIdList});
  }
}
