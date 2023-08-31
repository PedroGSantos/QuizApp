import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/main.dart';
import 'package:quiz_app/network.dart';
import 'package:quiz_app/pages/question.dart'; // Importe o pacote do carrossel
import 'package:quiz_app/generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    S localizations = S.of(context);
    _setLocale(String language) {
      setState(() {
        S.load(Locale(language));
      });
    }

    final globalState = Provider.of<MyGlobalState>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
                left: 24.0, top: 60.0), // Adicione margem a todos os lados
            child: Text(
              localizations.welcomeMessage,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20), // Espaço entre os textos
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: Row(
              children: [
                const Icon(Icons.check, color: Colors.green), // Ícone de check
                const SizedBox(width: 10), // Espaço entre o ícone e o texto
                Text(
                  localizations.answers(globalState.counter),
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(height: 122), // Espaço entre os textos
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Question(questionType: localizations.movies)),
                  );
                },
                child: Container(
                  width: 250,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF6F00),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 16.0),
                        child: Text(
                          localizations.movies,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 8.0),
                        child: Text(
                          localizations.descriptin_movie,
                          style: const TextStyle(
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
                    MaterialPageRoute(
                        builder: (context) =>
                            Question(questionType: localizations.sports)),
                  );
                },
                child: Container(
                  width: 250,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF6F00),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 16.0),
                        child: Text(
                          localizations.sports,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 8.0),
                        child: Text(
                          localizations.description_sports,
                          style: const TextStyle(
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
                    MaterialPageRoute(
                        builder: (context) =>
                            Question(questionType: localizations.games)),
                  );
                },
                child: Container(
                  width: 250,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF6F00),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 16.0),
                        child: Text(
                          localizations.games,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 8.0),
                        child: Text(
                          localizations.description_games,
                          style: const TextStyle(
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
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: const Text('Português'),
                onPressed: () => _setLocale('pt'),
              ),
              ElevatedButton(
                child: const Text('Inglês'),
                onPressed: () => _setLocale('en'),
              ),
            ],
          )
        ],
      ),
      floatingActionButton: const Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // ...
        ],
      ),
    );
  }
}
