import 'package:json_annotation/json_annotation.dart';

part 'applet.g.dart';

@JsonSerializable()
class Applet {
  final String prompt;
  final String name;
  final InputType inputType;
  final OutputType outputType;

  // Optional
  final String description;
  final String inputPrompt;
  final String outputPrompt;
  final bool showPrompt;

  Applet({
    required this.prompt,
    required this.name,
    required this.inputType,
    required this.outputType,
    this.description = "",
    this.inputPrompt = "",
    this.outputPrompt = "",
    this.showPrompt = true,
  });

  factory Applet.fromJson(Map<String, dynamic> json) => _$AppletFromJson(json);
  Map<String, dynamic> toJson() => _$AppletToJson(this);
}

enum InputType {
  text,
  image,
  audio,
}

enum OutputType {
  text,
  image,
  audio,
}
