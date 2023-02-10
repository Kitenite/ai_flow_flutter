import 'package:ai_flow/utils/uuid.dart';
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
  final OutputType outputType;

  // Optional
  final String description;
  final String inputPrompt;
  final String outputPrompt;
  final bool showPrompt;

  Applet({
    required this.prompt,
    required this.name,
    required this.outputType,
    this.description = "",
    this.inputPrompt = "",
    this.outputPrompt = "",
    this.showPrompt = true,
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
