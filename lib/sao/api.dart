import 'dart:convert';

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
}
