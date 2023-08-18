import 'package:flutter/material.dart';
import './pages/question.dart';
import './pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/', // Defina a rota inicial
      routes: {
        '/': (context) => Home(),
        '/question': (context) => Question(), // Rota para a tela secundária
      },
    );
  }
}
