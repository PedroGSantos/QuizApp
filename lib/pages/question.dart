import 'package:flutter/material.dart';

class Question extends StatefulWidget {
  const Question({super.key});

  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  bool _checkbox1 = false;
  bool _checkbox2 = false;
  bool _checkbox3 = false;
  bool _checkbox4 = false;
  bool _answerCorrect = false;
  bool _answerIncorrect = false;

  final Color _componentColor =
      const Color(0xFF4BD11B); // Defina a cor desejada

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
  Widget build(BuildContext context) {
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
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.only(
                        left: 20.0,
                        top: 16.0), // Adicione margem a todos os lados
                    child: Text('Esportes',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFFFFFF)))),
                SizedBox(height: 10),
                Padding(
                    padding: EdgeInsets.only(
                        left: 20.0,
                        top: 8.0), // Adicione margem a todos os lados
                    child: Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Mais texto haha e bem mais',
                        style:
                            TextStyle(fontSize: 24, color: Color(0xFFFFFFFF)))),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: CheckboxListTile(
              title: const Text('Ginástica Artística'),
              value: _checkbox1,
              onChanged:
                  _answerCorrect || _answerIncorrect ? null : _handleCheckbox1,
              activeColor: const Color(0xFFFF6F00),
              controlAffinity: ListTileControlAffinity.leading,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: CheckboxListTile(
              title: const Text('Natação'),
              value: _checkbox2,
              onChanged:
                  _answerCorrect || _answerIncorrect ? null : _handleCheckbox2,
              activeColor: const Color(0xFFFF6F00),
              controlAffinity: ListTileControlAffinity.leading,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: CheckboxListTile(
              title: const Text('Atletismo (Corrida e Campo)'),
              value: _checkbox3,
              onChanged:
                  _answerCorrect || _answerIncorrect ? null : _handleCheckbox3,
              activeColor: const Color(0xFFFF6F00),
              controlAffinity: ListTileControlAffinity.leading,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: CheckboxListTile(
              title: const Text('Nado Sincronizado'),
              value: _checkbox4,
              onChanged:
                  _answerCorrect || _answerIncorrect ? null : _handleCheckbox4,
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
                          SizedBox(width: 10), // Espaço entre o ícone e o texto
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
                          SizedBox(width: 10), // Espaço entre o ícone e o texto
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
                    onPressed: () {
                      if (_checkbox1) {
                        setState(() {
                          _answerCorrect = true;
                          _checkbox1 = false;
                          _checkbox2 = false;
                          _checkbox3 = false;
                          _checkbox4 = false;
                        });
                      } else {
                        setState(() {
                          _answerIncorrect = true;
                          _checkbox1 = false;
                          _checkbox2 = false;
                          _checkbox3 = false;
                          _checkbox4 = false;
                        });
                      }
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color(0xFFFF6F00),
                      fixedSize: const Size(250.0, 50.0),
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    child: const Text('ENVIAR'),
                  ),
                ),
        ],
      ),
    );
  }
}
