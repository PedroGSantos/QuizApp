import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Color(0xFFFF6F00),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 1000, 
            height: 220,
            decoration: BoxDecoration(
              color: Color(0xFFFF6F00), 
            ),
            child: Column(
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
        ],
      ),
    );
  }
}
