class Constants {
  // Routes
  static const String homeRoute = "/home";
  static const String createRoute = "/create";
  static const String runRoute = "/run";
  static const String waitRoute = "/wait";
  static const String cameraRoute = "/camera";

  // Firebase collection IDs
  static const String usersCollectionId = "users";
  static const String collectionsCollectionId = "collections";
  static const String appletsCollectionId = "applets";
  static const String marketplaceCollectionId = "marketplaceTestCollection";

  // Shared preferences (local storage)
  static const String userIdPreference = "user_id";

  // API
  static const String baseApi =
      "p25rp3yl2f.execute-api.us-east-1.amazonaws.com";
  static const String textToTextApiPath = "prod/txt2txt";
  static const String imageToTextApiPath = "$baseApi/img2txt";
}
