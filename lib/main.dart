import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/generated/intl/messages_all.dart';
import 'package:quiz_app/generated/l10n.dart';
import './pages/question.dart';
import './pages/home.dart';

Future<void> main() async {
  runApp(const MyApp());
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
