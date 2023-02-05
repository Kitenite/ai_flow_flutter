import 'package:ai_flow/utils/uuid.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String id = UUIDUtil.createUUID();
  List<String> collectionIds = [];

  User();
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  void addCollectionId(String collectionId) {
    collectionIds.add(collectionId);
  }
}
