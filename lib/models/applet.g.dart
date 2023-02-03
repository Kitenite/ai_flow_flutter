// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'applet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Applet _$AppletFromJson(Map<String, dynamic> json) => Applet(
      prompt: json['prompt'] as String,
      name: json['name'] as String,
      inputType: $enumDecode(_$InputTypeEnumMap, json['inputType']),
      outputType: $enumDecode(_$OutputTypeEnumMap, json['outputType']),
      description: json['description'] as String? ?? "",
      inputPrompt: json['inputPrompt'] as String? ?? "",
      outputPrompt: json['outputPrompt'] as String? ?? "",
      showPrompt: json['showPrompt'] as bool? ?? true,
    );

Map<String, dynamic> _$AppletToJson(Applet instance) => <String, dynamic>{
      'prompt': instance.prompt,
      'name': instance.name,
      'inputType': _$InputTypeEnumMap[instance.inputType]!,
      'outputType': _$OutputTypeEnumMap[instance.outputType]!,
      'description': instance.description,
      'inputPrompt': instance.inputPrompt,
      'outputPrompt': instance.outputPrompt,
      'showPrompt': instance.showPrompt,
    };

const _$InputTypeEnumMap = {
  InputType.text: 'text',
  InputType.image: 'image',
  InputType.audio: 'audio',
};

const _$OutputTypeEnumMap = {
  OutputType.text: 'text',
  OutputType.image: 'image',
  OutputType.audio: 'audio',
};
