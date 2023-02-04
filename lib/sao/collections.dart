import 'package:ai_flow/models/collection.dart';
import 'package:ai_flow/resources/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CollectionDataAccessor {
  static Future<Collection> createNewCollection(String name) async {
    Collection newCollection = Collection(name: name);
    // Save collection in firestore
    FirebaseFirestore.instance
        .collection(collectionsCollectionId)
        .add(newCollection.toJson())
        .then(
          (DocumentReference doc) =>
              print('New collection added to DB with ID: ${doc.id}'),
        );
    return newCollection;
  }
}
