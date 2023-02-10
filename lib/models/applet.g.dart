// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'applet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppletCollection _$AppletCollectionFromJson(Map<String, dynamic> json) =>
    AppletCollection()
      ..id = json['id'] as String
      ..applets = (json['applets'] as List<dynamic>)
          .map((e) => Applet.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$AppletCollectionToJson(AppletCollection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'applets': instance.applets,
    };

Applet _$AppletFromJson(Map<String, dynamic> json) => Applet(
      prompt: json['prompt'] as String,
      name: json['name'] as String,
      outputType: $enumDecode(_$OutputTypeEnumMap, json['outputType']),
      description: json['description'] as String? ?? "",
      inputPrompt: json['inputPrompt'] as String? ?? "",
      outputPrompt: json['outputPrompt'] as String? ?? "",
      showPrompt: json['showPrompt'] as bool? ?? true,
    )..id = json['id'] as String;

Map<String, dynamic> _$AppletToJson(Applet instance) => <String, dynamic>{
      'id': instance.id,
      'prompt': instance.prompt,
      'name': instance.name,
      'outputType': _$OutputTypeEnumMap[instance.outputType]!,
      'description': instance.description,
      'inputPrompt': instance.inputPrompt,
      'outputPrompt': instance.outputPrompt,
      'showPrompt': instance.showPrompt,
    };

const _$OutputTypeEnumMap = {
  OutputType.text: 'text',
  OutputType.image: 'image',
  OutputType.audio: 'audio',
};
