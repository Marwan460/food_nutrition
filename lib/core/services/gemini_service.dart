import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

class GeminiService {
  static final Gemini _gemini = Gemini.init(apiKey: 'AIzaSyAE2qk9uvdRRn-7A48yOotM_sZRSyTD01M');

  static Future<String?> sendQuery({
    required String userQuery,
    String? systemContext,
    String? responseFormat,
  }) async {
    try {
      final prompt = _buildSystemPrompt(
        contextDescription: systemContext,
        responseInstructions: responseFormat, userQuery: userQuery,

      );

      final response = await _gemini.prompt(
        parts: [Part.text(prompt)],
      );
      debugPrint(response?.output);

      return response?.output;
    } catch (e) {
      debugPrint('Gemini Error: ${e.toString()}');
      return null;
    }
  }

  static String _buildSystemPrompt({
    String? contextDescription,
    String? responseInstructions,
    required String userQuery,
  }) {
    final buffer = StringBuffer();

    buffer.write(contextDescription ?? 'You are an AI assistant whose ONLY purpose is to provide information and answer questions DIRECTLY related to food and nutrition. You MUST NOT discuss any other topics.\n');
    buffer.write('If the user\'s query: "${userQuery}" is about anything other than food or nutrition, your ONLY allowed response is: "I am designed to help with questions about food and nutrition. I cannot assist with other topics."\n');
    if(responseInstructions != null){
      buffer.write('${responseInstructions}\n');
    }

    buffer.write('For valid food and nutrition related queries, provide a concise and helpful response.');

    return buffer.toString();
  }
}
