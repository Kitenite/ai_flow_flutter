import 'package:flutter/material.dart';

class Constants {
  // Routes
  static const String homeRoute = "/home";
  static const String createRoute = "/create";
  static const String runRoute = "/run";
  static const String waitRoute = "/wait";

  // Firebase collection IDs
  static const String usersCollectionId = "users";
  static const String collectionsCollectionId = "collections";
  static const String appletsCollectionId = "applets";
  static const String jokesCollectionId = "jokes";
  static const String writingCollectionId = "writing";
  static const String foodCollectionId = "food";
  static const String codingCollectionId = "coding";

  // Shared preferences (local storage)
  static const String userIdPreference = "user_id";

  // API
  static const String baseApi =
      "p25rp3yl2f.execute-api.us-east-1.amazonaws.com";
  static const String textToTextApiPath = "prod/txt2txt";
  static const String speechToTextApiPath = "prod/audio2txt";
  static const String imageToTextApiPath = "prod/img2txt";

  // Icons
  static List<IconData> icons = [
    Icons.text_fields,
    Icons.photo,
    Icons.audiotrack,
    Icons.book,
    Icons.person,
    Icons.soup_kitchen,
    Icons.comment,
    Icons.theater_comedy,
  ];
}
