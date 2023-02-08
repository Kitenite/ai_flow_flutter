import 'package:json_annotation/json_annotation.dart';
part 'speech_to_text_response.g.dart';

@JsonSerializable()
class SpeechToTextResponse {
  String transcript = "";
  SpeechToTextResponse();

  factory SpeechToTextResponse.fromJson(Map<String, dynamic> json) =>
      _$SpeechToTextResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SpeechToTextResponseToJson(this);
}
