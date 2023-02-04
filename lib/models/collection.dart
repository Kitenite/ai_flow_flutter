import 'package:ai_flow/utils/uuid.dart';
import 'package:json_annotation/json_annotation.dart';
part 'collection.g.dart';

@JsonSerializable()
class Collection {
  String id = createUUID();
  List<String> appletIds = List.empty();
  String name;

  Collection({
    required this.name,
  });

  factory Collection.fromJson(Map<String, dynamic> json) =>
      _$CollectionFromJson(json);
  Map<String, dynamic> toJson() => _$CollectionToJson(this);
}
