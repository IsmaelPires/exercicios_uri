import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Exercicio1001 extends StatelessWidget {
  static const platform = const MethodChannel("uri_exercicios");

  final controllerA = TextEditingController();
  final controllerB = TextEditingController();

  int soma = 0;
  String resultado = "X = ";

  Future _actionCalcularSoma(valorA, valorB, context) async {
    int result = 0;
    try {
      result = await platform.invokeMethod(
          "actionCalcularSoma", {"valorA": valorA, "valorB": valorB});
      soma = result;
      _showDialog(soma, context);
      print(">> Resultado:  $result");
    } on PlatformException catch (e) {
      print(e.message);
    }
  }

  _showDialog(soma, context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: new Text("Resultado"),
          content: Text(soma.toString()),
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
        title: Text("Exercicio 1001"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                  "Leia 2 valores inteiros e armazene-os nas variáveis A e B. Efetue a soma de A e B atribuindo o seu resultado na variável X."),
              TextFormField(
                controller: controllerA,
                autofocus: false,
                keyboardType: TextInputType.number,
                style: new TextStyle(color: Colors.black, fontSize: 20),
                decoration: InputDecoration(
                    labelText: "Valor A",
                    labelStyle: TextStyle(color: Colors.black)),
              ),
              TextFormField(
                controller: controllerB,
                autofocus: false,
                keyboardType: TextInputType.number,
                style: new TextStyle(color: Colors.black, fontSize: 20),
                decoration: InputDecoration(
                    labelText: "Valor B",
                    labelStyle: TextStyle(color: Colors.black)),
              ),
              Divider(),
              ButtonTheme(
                height: 60.0,
                child: RaisedButton(
                  color: Colors.deepOrangeAccent,
                  onPressed: () {
                    _actionCalcularSoma(int.parse(controllerA.text),
                        int.parse(controllerB.text), context);
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
