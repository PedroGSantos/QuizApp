import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/generated/intl/messages_all.dart';
import 'package:quiz_app/generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './pages/question.dart';
import './pages/home.dart';

class MyGlobalState extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  MyGlobalState() {
    _init();
  }

  void _init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counter = prefs.getInt('answerCount') ?? 0;
    notifyListeners();
  }
  
  void incrementCounter() {
    _counter++;
    notifyListeners(); // Notificar todos os ouvintes sobre a mudança
  }

  // Adicione outros estados e métodos conforme necessário
}

Future<void> main() async {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MyGlobalState(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      localizationsDelegates: const [
        S.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      initialRoute: '/', // Defina a rota inicial
      routes: {
        '/': (context) => const Home(),
        '/question': (context) =>
            Question(questionType: 'filmes'), // Rota para a tela secundária
      },
    );
  }
}
