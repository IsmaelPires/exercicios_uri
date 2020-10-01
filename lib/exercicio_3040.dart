import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Exercicio3040 extends StatelessWidget {
  static const platform = const MethodChannel("fatorial_nativo");

  String fatorial = "Exemplo";

  Future _actionCalcularFatorial(valor) async {
    int result = 0;

    try {
      result = await platform
          .invokeMethod("actionCalcularFatorial", {"valor": valor});
      print(">> Resultado:  $result");
    } on PlatformException catch (e) {
      print(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exercicio 3040"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text(
            "Fatorial",
            style: TextStyle(fontSize: 10),
          ),
          onPressed: () {
            _actionCalcularFatorial(5);
          },
        ),
      ),
    );
  }
}
