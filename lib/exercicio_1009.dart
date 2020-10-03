import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Exercicio1009 extends StatelessWidget {
  static const platform = const MethodChannel("uri_exercicios");

  final controllerNome = TextEditingController();
  final controllerSalario = TextEditingController();
  final controllerVendas = TextEditingController();

  String nome = "";
  double salario = 0.00;
  double vendas = 0.00;
  double total = 0.00;
  String resultado = "TOTAL = R\$ ";

  Future _actionCalcularTotal(nome, salario, vendas) async {
    double result = 0.00;
    try {
      result = await platform.invokeMethod("actionCalcularTotal",
          {"salario": double.parse(salario), "vendas": double.parse(vendas)});
      total = result;
      print(">> Resultado:  $result");
    } on PlatformException catch (e) {
      print(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Exercicio 1009"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                  "Faça um programa que leia o nome de um vendedor, o seu salário fixo e o total de vendas (15%) efetuadas por ele no mês (em dinheiro)."),
              TextFormField(
                controller: controllerNome,
                autofocus: false,
                keyboardType: TextInputType.text,
                style: new TextStyle(color: Colors.black, fontSize: 20),
                decoration: InputDecoration(
                    labelText: "Nome",
                    labelStyle: TextStyle(color: Colors.black)),
              ),
              TextFormField(
                controller: controllerSalario,
                autofocus: false,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                style: new TextStyle(color: Colors.black, fontSize: 20),
                decoration: InputDecoration(
                    labelText: "Salário",
                    labelStyle: TextStyle(color: Colors.black)),
              ),
              TextFormField(
                controller: controllerVendas,
                autofocus: false,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                style: new TextStyle(color: Colors.black, fontSize: 20),
                decoration: InputDecoration(
                    labelText: "Vendas",
                    labelStyle: TextStyle(color: Colors.black)),
              ),
              Divider(),
              ButtonTheme(
                height: 60.0,
                child: RaisedButton(
                  color: Colors.deepOrangeAccent,
                  onPressed: () {
                    _actionCalcularTotal(controllerNome.text,
                        controllerSalario.text, controllerVendas.text);
                    return showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                            title: new Text("Resultado"),
                            content: Text(resultado + total.toStringAsFixed(2)),
                            actions: <Widget>[
                              // define os botões na base do dialogo
                              new FlatButton(
                                child: new Text("Fechar"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ]);
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
