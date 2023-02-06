import 'package:ai_flow/models/applet.dart';
import 'package:ai_flow/resources/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMockHelpers {
  static List<Applet> marketplaceApplets = [
    Applet(
        name: "Vegan ingredients",
        prompt:
            "Look at this list of recipes. For each ingredient, explain the ingredients in 1-2 sentences and say if they are vegan. Then at the end, say whether all the ingredients are vegan or not vegan: ",
        description:
            "Takes a list of ingredients and say whether or not it's vegan",
        inputType: InputType.text,
        outputType: OutputType.text,
        inputPrompt: "Add your list of ingredients here"),
  ];

  static void addAppletToMarketplace() {
    FirebaseFirestore.instance
        .collection(Constants.collectionsCollectionId)
        .doc(Constants.marketplaceCollectionId)
        .update({"data": "Test"});
  }
}
