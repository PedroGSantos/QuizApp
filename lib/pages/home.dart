import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:quiz_app/network.dart';
import 'package:quiz_app/pages/question.dart'; // Importe o pacote do carrossel

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                left: 24.0, top: 60.0), // Adicione margem a todos os lados
            child: Text(
              'Bem vindo, Pedro', // Substitua "fulano" pelo nome real
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 20), // Espaço entre os textos
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.0),
            child: Row(
              children: [
                Icon(Icons.check, color: Colors.green), // Ícone de check
                SizedBox(width: 10), // Espaço entre o ícone e o texto
                Text(
                  '38 respostas certas!',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(height: 122), // Espaço entre os textos
          CarouselSlider(
            options: CarouselOptions(
                height: 300, // Altura do carrossel
                autoPlay: false,
                aspectRatio: 16 / 9,
                viewportFraction: 0.72,
                enableInfiniteScroll: false),
            items: [
              // Itens do carrossel
              // Item 1
              GestureDetector(
                onTap: () async {
                  try {
                    QuestionGenerated question = await fetchQuestion();
                    print("Pergunta: ${question.questionText}");
                  } catch (e) {
                    print("Erro ao buscar pergunta: $e");
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Question()),
                  );
                },
                child: Container(
                  width: 250,
                  decoration: BoxDecoration(
                    color: Color(0xFFFF6F00),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20.0, top: 16.0),
                        child: Text(
                          'Filmes',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.only(left: 20.0, top: 8.0),
                        child: Text(
                          'Lorem Ipsum is simply dummy text...',
                          style: TextStyle(
                            fontSize: 24,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Question()),
                  );
                },
                child: Container(
                  width: 250,
                  decoration: BoxDecoration(
                    color: Color(0xFFFF6F00),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20.0, top: 16.0),
                        child: Text(
                          'Esportes',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.only(left: 20.0, top: 8.0),
                        child: Text(
                          'Lorem Ipsum is simply dummy text...',
                          style: TextStyle(
                            fontSize: 24,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // ...
        ],
      ),
    );
  }
}
