import 'package:ai_flow/utils/uuid.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'applet.g.dart';

@JsonSerializable()
class AppletCollection {
  String id = UUIDUtil.createUUID();
  List<Applet> applets = List.empty();

  AppletCollection();

  factory AppletCollection.fromJson(Map<String, dynamic> json) =>
      _$AppletCollectionFromJson(json);
  Map<String, dynamic> toJson() => _$AppletCollectionToJson(this);
}

@JsonSerializable()
class Applet {
  String id = UUIDUtil.createUUID();
  final String prompt;
  final String name;

  // Optional
  final String description;
  final String inputPrompt;
  final bool showPrompt;
  final int iconIndex;

  Applet({
    required this.prompt,
    required this.name,
    this.description = "",
    this.inputPrompt = "",
    this.showPrompt = true,
    this.iconIndex = 0,
  });

  factory Applet.fromJson(Map<String, dynamic> json) => _$AppletFromJson(json);
  Map<String, dynamic> toJson() => _$AppletToJson(this);
}

enum OutputType {
  text("Text"),
  image("Image"),
  audio("Audio");

  const OutputType(this.value);
  final String value;
}
