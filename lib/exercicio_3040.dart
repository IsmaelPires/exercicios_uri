import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Exercicio3040 extends StatelessWidget {
  static const platform = const MethodChannel("uri_exercicios");

  final controllerVezes = TextEditingController();
  final controllerAltura = TextEditingController();
  final controllerDiametro = TextEditingController();
  final controllerGalhos = TextEditingController();

  String resultado = "";

  Future _actionCalcularMedidas(altura, diametro, galhos, context) async {
    String result = "";

    try {
      result = await platform.invokeMethod("actionCalcularMedidas",
          {"altura": altura, "diametro": diametro, "galhos": galhos});
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
        title: Text("Exercicio 3040"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                  "A primeira linha de entrada contém um inteiro N (0 < N ≤ 10000), o número de casos teste. As N linhas seguintes contém 3 inteiros cada, h, de g (0 < a, d, g ≤ 5000), a altura da árvore em centímetros, o seu diâmetro em centímetros, e a quantidade de galhos da árvore."),
              // TextFormField(
              //   controller: controllerVezes,
              //   autofocus: false,
              //   keyboardType: TextInputType.number,
              //   style: new TextStyle(color: Colors.black, fontSize: 20),
              //   decoration: InputDecoration(
              //       labelText: "Vezes",
              //       labelStyle: TextStyle(color: Colors.black)),
              // ),
              TextFormField(
                controller: controllerAltura,
                autofocus: false,
                keyboardType: TextInputType.number,
                style: new TextStyle(color: Colors.black, fontSize: 20),
                decoration: InputDecoration(
                    labelText: "Altura",
                    labelStyle: TextStyle(color: Colors.black)),
              ),
              TextFormField(
                controller: controllerDiametro,
                autofocus: false,
                keyboardType: TextInputType.number,
                style: new TextStyle(color: Colors.black, fontSize: 20),
                decoration: InputDecoration(
                    labelText: "Diâmetro",
                    labelStyle: TextStyle(color: Colors.black)),
              ),
              TextFormField(
                controller: controllerGalhos,
                autofocus: false,
                keyboardType: TextInputType.number,
                style: new TextStyle(color: Colors.black, fontSize: 20),
                decoration: InputDecoration(
                    labelText: "Galhos",
                    labelStyle: TextStyle(color: Colors.black)),
              ),
              Divider(),
              ButtonTheme(
                height: 60.0,
                child: RaisedButton(
                  color: Colors.deepOrangeAccent,
                  onPressed: () {
                    _actionCalcularMedidas(
                        int.parse(controllerAltura.text),
                        int.parse(controllerDiametro.text),
                        int.parse(controllerGalhos.text),
                        context);
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
