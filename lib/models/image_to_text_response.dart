import 'package:json_annotation/json_annotation.dart';
part 'image_to_text_response.g.dart';

@JsonSerializable()
class ImageToTextResponse {
  String transcript = "";
  ImageToTextResponse();

  factory ImageToTextResponse.fromJson(Map<String, dynamic> json) =>
      _$ImageToTextResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ImageToTextResponseToJson(this);
}
