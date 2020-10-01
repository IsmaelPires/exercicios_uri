import 'package:flutter/material.dart';
import 'exercicio_1001.dart';
import 'exercicio_1009.dart';
import 'exercicio_1018.dart';
import 'exercicio_2344.dart';
import 'exercicio_3040.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    debugShowCheckedModeBanner: false,
    home: FirstRoute(),
  ));
}

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercícos URI'),
      ),
      body: Center(
        child: Column(
          children: [
            RaisedButton(
              child: Text('Exercício 1001'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Exercicio1001()),
                );
              },
            ),
            RaisedButton(
              child: Text('Exercício 1009'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Exercicio1009()),
                );
              },
            ),
            RaisedButton(
              child: Text('Exercício 1018'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Exercicio1018()),
                );
              },
            ),
            RaisedButton(
              child: Text('Exercício 2344'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Exercicio2344()),
                );
              },
            ),
            RaisedButton(
              child: Text('Exercício 3040'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Exercicio3040()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
