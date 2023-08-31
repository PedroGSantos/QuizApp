import 'package:flutter/material.dart';
import 'package:quiz_app/network.dart';
import 'package:quiz_app/generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Question extends StatefulWidget {
  final String questionType;

  const Question({super.key, required this.questionType});

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  bool _checkbox1 = false;
  bool _checkbox2 = false;
  bool _checkbox3 = false;
  bool _checkbox4 = false;
  bool _answerCorrect = false;
  bool _answerIncorrect = false;
  int answerCount = 0;

  late Future<QuestionGenerated> _questionFuture;
  final Color _componentColor =
      const Color(0xFF4BD11B); // Defina a cor desejada

  _incrementAnswerCount() async {
    // Função para adicionar 1 resposta correta a mais
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      answerCount = prefs.getInt('answerCount') ?? 0;
      answerCount++;
      prefs.setInt('answerCount', answerCount);
    });
  }

  void _handleCheckbox1(bool? value) {
    setState(() {
      _checkbox1 = value!;
      if (_checkbox1) {
        _checkbox2 = false;
        _checkbox3 = false;
        _checkbox4 = false;
      }
    });
  }

  void _handleCheckbox2(bool? value) {
    setState(() {
      _checkbox2 = value!;
      if (_checkbox2) {
        _checkbox1 = false;
        _checkbox3 = false;
        _checkbox4 = false;
      }
    });
  }

  void _handleCheckbox3(bool? value) {
    setState(() {
      _checkbox3 = value!;
      if (_checkbox3) {
        _checkbox1 = false;
        _checkbox2 = false;
        _checkbox4 = false;
      }
    });
  }

  void _handleCheckbox4(bool? value) {
    setState(() {
      _checkbox4 = value!;
      if (_checkbox4) {
        _checkbox1 = false;
        _checkbox2 = false;
        _checkbox3 = false;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _questionFuture = fetchQuestion(widget.questionType);
  }

  @override
  Widget build(BuildContext context) {
    S localizations = S.of(context);
    return FutureBuilder<QuestionGenerated>(
      future: _questionFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Erro: ${snapshot.error}');
        } else if (!snapshot.hasData) {
          return Text('Nenhum dado disponível');
        } else {
          QuestionGenerated question = snapshot.data!;
          // Agora você pode usar `question.questionText`, `question.options`, e `question.correctAnswer`
          return Scaffold(
            appBar: AppBar(
              title: const Text(''),
              backgroundColor: _answerCorrect || _answerIncorrect
                  ? _answerCorrect
                      ? const Color(0xFF4BD11B)
                      : const Color(0xFFD71616)
                  : const Color(0xFFFF6F00),
              iconTheme: const IconThemeData(color: Colors.white),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 1000,
                  height: 220,
                  decoration: BoxDecoration(
                    color: _answerCorrect || _answerIncorrect
                        ? _answerCorrect
                            ? const Color(0xFF4BD11B)
                            : const Color(0xFFD71616)
                        : const Color(0xFFFF6F00),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(
                              left: 20.0,
                              top: 16.0), // Adicione margem a todos os lados
                          child: Text(widget.questionType,
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFFFFFFF)))),
                      SizedBox(height: 10),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 20.0,
                              top: 8.0), // Adicione margem a todos os lados
                          child: Text(snapshot.data!.questionText,
                              style: TextStyle(
                                  fontSize: 24, color: Color(0xFFFFFFFF)))),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: CheckboxListTile(
                    title: Text(snapshot.data!.options[0]),
                    value: _checkbox1,
                    onChanged: _answerCorrect || _answerIncorrect
                        ? null
                        : _handleCheckbox1,
                    activeColor: const Color(0xFFFF6F00),
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: CheckboxListTile(
                    title: Text(snapshot.data!.options[1]),
                    value: _checkbox2,
                    onChanged: _answerCorrect || _answerIncorrect
                        ? null
                        : _handleCheckbox2,
                    activeColor: const Color(0xFFFF6F00),
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: CheckboxListTile(
                    title: Text(snapshot.data!.options[2]),
                    value: _checkbox3,
                    onChanged: _answerCorrect || _answerIncorrect
                        ? null
                        : _handleCheckbox3,
                    activeColor: const Color(0xFFFF6F00),
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: CheckboxListTile(
                    title: Text(snapshot.data!.options[3]),
                    value: _checkbox4,
                    onChanged: _answerCorrect || _answerIncorrect
                        ? null
                        : _handleCheckbox4,
                    activeColor: const Color(0xFFFF6F00),
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                ),
                const SizedBox(height: 100),
                _answerCorrect || _answerIncorrect
                    ? _answerCorrect
                        ? const Align(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .center, // Alinha horizontalmente ao centro
                              children: [
                                Icon(
                                  Icons.check,
                                  color: Color(0xFF4BD11B),
                                  size: 36,
                                ), // Ícone de check
                                SizedBox(
                                    width:
                                        10), // Espaço entre o ícone e o texto
                                Text(
                                  'CORRETO!',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF4BD11B)),
                                ),
                              ],
                            ),
                          )
                        : const Align(
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .center, // Alinha horizontalmente ao centro
                              children: [
                                Icon(
                                  Icons.close,
                                  color: Color(0xFFD71616),
                                  size: 36,
                                ), // Ícone de check
                                SizedBox(
                                    width:
                                        10), // Espaço entre o ícone e o texto
                                Text(
                                  'INCORRETO!',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFD71616)),
                                ),
                              ],
                            ),
                          )
                    : Align(
                        alignment: Alignment.center,
                        child: TextButton(
                          onPressed: () async {
                            void checkAnswer(int checkbox) {
                              if (snapshot.data!.options[checkbox] ==
                                  snapshot.data!.correctAnswer) {
                                setState(() {
                                  _answerCorrect = true;
                                });
                                _incrementAnswerCount();
                              } else {
                                setState(() {
                                  _answerIncorrect = true;
                                });
                              }
                            }

                            if (_checkbox1) checkAnswer(0);

                            if (_checkbox2) checkAnswer(1);

                            if (_checkbox3) checkAnswer(2);

                            if (_checkbox4) checkAnswer(3);
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: const Color(0xFFFF6F00),
                            fixedSize: const Size(250.0, 50.0),
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          child: Text(localizations.button),
                        ),
                      ),
              ],
            ),
          );
        }
      },
    );
  }
}
