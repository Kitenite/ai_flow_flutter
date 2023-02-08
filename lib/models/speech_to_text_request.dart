import 'package:json_annotation/json_annotation.dart';
part 'speech_to_text_request.g.dart';

@JsonSerializable()
class SpeechToTextRequest {
  String audio_content;
  SpeechToTextRequest({
    required this.audio_content,
  });

  factory SpeechToTextRequest.fromJson(Map<String, dynamic> json) =>
      _$SpeechToTextRequestFromJson(json);
  Map<String, dynamic> toJson() => _$SpeechToTextRequestToJson(this);
}
