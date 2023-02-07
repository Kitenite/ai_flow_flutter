import 'package:ai_flow/utils/uuid.dart';
import 'package:json_annotation/json_annotation.dart';
part 'collection.g.dart';

enum CollectionType {
  personal,
  marketplace,
  none,
}

@JsonSerializable()
class Collection {
  String id = UUIDUtil.createUUID();
  List<String> appletIds = List.empty();
  String name;
  CollectionType collectionType;

  Collection({
    required this.name,
    this.collectionType = CollectionType.none,
  });

  factory Collection.fromJson(Map<String, dynamic> json) =>
      _$CollectionFromJson(json);
  Map<String, dynamic> toJson() => _$CollectionToJson(this);
}
