import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Exercicio1018 extends StatelessWidget {
  static const platform = const MethodChannel("uri_exercicios");

  final controllerValor = TextEditingController();

  String resultado;
  int valor = 0;

  Future _actionCalcularNotas(valor, context) async {
    String result;

    try {
      result =
          await platform.invokeMethod("actionCalcularNotas", {"valor": valor});
      resultado = result;
      _showDialog(resultado, context);
      print(">> Resultado:  $result");
    } on PlatformException catch (e) {
      print(e.message);
    }
  }

  _showDialog(resultado, context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: new Text("Resultado"),
          content: Text(resultado),
          actions: <Widget>[
            // define os botões na base do dialogo
            new FlatButton(
              child: new Text("Fechar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Exercicio 1018"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                  "Leia um valor inteiro. A seguir, calcule o menor número de notas possíveis (cédulas) no qual o valor pode ser decomposto. As notas consideradas são de 100, 50, 20, 10, 5, 2 e 1. A seguir mostre o valor lido e a relação de notas necessárias."),
              TextFormField(
                controller: controllerValor,
                autofocus: false,
                keyboardType: TextInputType.number,
                style: new TextStyle(color: Colors.black, fontSize: 20),
                decoration: InputDecoration(
                    labelText: "Valor",
                    labelStyle: TextStyle(color: Colors.black)),
              ),
              Divider(),
              ButtonTheme(
                height: 60.0,
                child: RaisedButton(
                  color: Colors.deepOrangeAccent,
                  onPressed: () {
                    _actionCalcularNotas(
                        int.parse(controllerValor.text), context);
                  },
                  child: Text(
                    "Calcular",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
