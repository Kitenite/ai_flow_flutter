import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:ai_flow/models/speech_to_text_request.dart';
import 'package:ai_flow/models/speech_to_text_response.dart';
import 'package:ai_flow/models/image_to_text_request.dart';
import 'package:ai_flow/models/text_to_text_request.dart';
import 'package:ai_flow/models/text_to_text_response.dart';
import 'package:ai_flow/resources/constants.dart';
import 'package:http/http.dart' as http;

class ApiDataAccessor {
  static Future<String> textToText(String input) async {
    var url = Uri.https(Constants.baseApi, Constants.textToTextApiPath);
    const headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };

    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(TextToTextRequest(prompt: input).toJson()),
    );

    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
      TextToTextResponse responseObject =
          TextToTextResponse.fromJson(jsonDecode(response.body));
      return responseObject.response;
    } else {
      print(response.body);
      throw Exception('Failed to get response.');
    }
  }

  static Future<String> speechToText(List<int> audioFileBytes) async {
    var audioContent = base64Encode(audioFileBytes);
    var url = Uri.https(Constants.baseApi, Constants.speechToTextApiPath);
    const headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    final response = await http.post(url,
        headers: headers,
        body: jsonEncode(
            SpeechToTextRequest(audio_content: audioContent).toJson()));
    try {
      SpeechToTextResponse responseObject =
          SpeechToTextResponse.fromJson(jsonDecode(response.body));
      return responseObject.transcript;
    } catch (e) {
      return "";
    }
  }

  static Future<String> imageToText(File image) async {
    print("HERE");
    List<int> imageBytes = await image.readAsBytes();
    String base64Image = base64Encode(imageBytes);

    var url = Uri.https(Constants.baseApi, Constants.imageToTextApiPath);

    const headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };

    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(ImageToTextRequest(image: base64Image).toJson()),
    );

    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
      return response.body;
    } else {
      print(response.body);
      throw Exception('Failed to get response.');
    }
  }
}
