// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Collection _$CollectionFromJson(Map<String, dynamic> json) => Collection(
      name: json['name'] as String,
      collectionType: $enumDecodeNullable(
              _$CollectionTypeEnumMap, json['collectionType']) ??
          CollectionType.none,
    )
      ..id = json['id'] as String
      ..appletIds =
          (json['appletIds'] as List<dynamic>).map((e) => e as String).toList();

Map<String, dynamic> _$CollectionToJson(Collection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'appletIds': instance.appletIds,
      'name': instance.name,
      'collectionType': _$CollectionTypeEnumMap[instance.collectionType]!,
    };

const _$CollectionTypeEnumMap = {
  CollectionType.personal: 'personal',
  CollectionType.marketplace: 'marketplace',
  CollectionType.none: 'none',
};
