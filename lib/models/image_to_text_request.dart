import 'package:json_annotation/json_annotation.dart';
part 'image_to_text_request.g.dart';

@JsonSerializable()
class ImageToTextRequest {
  String image;
  ImageToTextRequest({
    required this.image,
  });

  factory ImageToTextRequest.fromJson(Map<String, dynamic> json) =>
      _$ImageToTextRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ImageToTextRequestToJson(this);
}
