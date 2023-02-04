import 'package:ai_flow/models/applet.dart';
import 'package:ai_flow/resources/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AppletDataAccessor {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static Future<Applet> createNewApplet(Applet newApplet) async {
    FirebaseFirestore.instance
        .collection(Constants.appletsCollectionId)
        .add(newApplet.toJson())
        .then(
          (DocumentReference doc) =>
              print('New applet added to DB with ID: ${doc.id}'),
        );
    return newApplet;
  }

  static Stream<Applet> streamUser(String id) {
    return _db.collection(Constants.usersCollectionId).doc(id).snapshots().map(
        (snapshot) => Applet.fromJson(snapshot.data as Map<String, dynamic>));
  }
}
