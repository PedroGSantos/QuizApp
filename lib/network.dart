import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'dart:async';
import 'dart:convert';
import 'dart:io';

Future<QuestionGenerated> fetchQuestion() async {
  final response = await http.post(
    Uri.parse('https://api.openai.com/v1/chat/completions'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization':
          'Bearer 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',
    },
    body: jsonEncode(<String, dynamic>{
      "model": "gpt-3.5-turbo",
      "messages": [
        {
          "role": "user",
          "content":
              "Vc consegue gerar uma pergunta sobre video game, de multipla escolha e mandar em formato json? Os parametros devem se chamar 'pergunta', 'opcoes', 'resposta_correta'"
        }
      ]
    }),
  );

  if (response.statusCode == 200) {
    Map<String, dynamic> apiResponse = jsonDecode(response.body);
    String content = apiResponse['choices'][0]['message']['content'];

    // Encontrar e extrair a parte JSON da resposta
    RegExp exp = RegExp(r'```json(.+)```', multiLine: true, dotAll: true);
    Match? match = exp.firstMatch(content);

    if (match != null) {
      String jsonStr = match.group(1)!.trim();
      Map<String, dynamic> questionJson = jsonDecode(jsonStr);

      return QuestionGenerated.fromJson(questionJson);
    } else {
      throw Exception('Failed to parse question JSON');
    }
  } else {
    throw Exception('Failed to load question');
  }
}

class QuestionGenerated {
  final String questionText;
  final List<String> options;
  final String
      correctAnswer; // alterado de correctAnswerIndex para correctAnswer

  QuestionGenerated({
    required this.questionText,
    required this.options,
    required this.correctAnswer,
  });

  factory QuestionGenerated.fromJson(Map<String, dynamic> json) {
    return QuestionGenerated(
      questionText: json['pergunta'],
      options: List<String>.from(json['opcoes']),
      correctAnswer: json['resposta_correta'],
    );
  }
}
