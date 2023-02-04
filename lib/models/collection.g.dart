// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Collection _$CollectionFromJson(Map<String, dynamic> json) => Collection(
      name: json['name'] as String,
    )
      ..id = json['id'] as String
      ..appletIds =
          (json['appletIds'] as List<dynamic>).map((e) => e as String).toList();

Map<String, dynamic> _$CollectionToJson(Collection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'appletIds': instance.appletIds,
      'name': instance.name,
    };
