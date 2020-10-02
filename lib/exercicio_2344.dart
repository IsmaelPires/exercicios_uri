import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Exercicio2344 extends StatelessWidget {
  static const platform = const MethodChannel("uri_exercicios");

  final controllerNota = TextEditingController();
  String resultado;

  Future _actionVerificarNota(nota) async {
    String result = "";

    try {
      result =
          await platform.invokeMethod("actionVerificarNota", {"nota": nota});
      resultado = result;
      print(">> Resultado:  $result");
    } on PlatformException catch (e) {
      print(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exercicio 2344"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                  "Deve escrever um programa que recebe uma nota no sistema numérico e determina o conceito correspondente."),
              TextFormField(
                controller: controllerNota,
                autofocus: false,
                keyboardType: TextInputType.number,
                style: new TextStyle(color: Colors.black, fontSize: 20),
                decoration: InputDecoration(
                    labelText: "Nota",
                    labelStyle: TextStyle(color: Colors.black)),
              ),
              Divider(),
              ButtonTheme(
                height: 60.0,
                child: RaisedButton(
                  color: Colors.deepOrangeAccent,
                  onPressed: () {
                    _actionVerificarNota(int.parse(controllerNota.text));
                    return showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text(resultado),
                          title: new Text("Resultado"),
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
