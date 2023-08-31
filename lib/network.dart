import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:convert';

Future<QuestionGenerated> fetchQuestion(String typeQuestion) async {
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
          "role": "system",
          "content": "Você cria perguntas sobre o assunto informado",
        },
        {
          "role": "user",
          "content":
              "Vc consegue gerar uma pergunta sobre ${typeQuestion}, de multipla escolha e mandar em formato json? Siga esse padrão pra enviar resposta (nao essa mesma pergunta denovo): {pergunta: Qual foi o lancamento mais recente da franquia 'Call of Duty'?, opcoes: [Call of Duty: Modern Warfare, Call of Duty: Black Ops 4, Call of Duty: WWII, Call of Duty: Infinite Warfare], resposta_correta: Call of Duty: Modern Warfare}"
        }
      ]
    }),
  );

  if (response.statusCode == 200) {
    Map<String, dynamic> apiResponse = jsonDecode(response.body);
    String content = apiResponse['choices'][0]['message']['content'];
    print(content);

    return QuestionGenerated.fromJson(jsonDecode(content));
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
