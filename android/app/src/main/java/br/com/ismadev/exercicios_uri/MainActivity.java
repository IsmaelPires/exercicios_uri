package br.com.ismadev.exercicios_uri;

import androidx.annotation.NonNull;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {

    private static final String CHANNEL = "uri_exercicios";

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);

        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
                .setMethodCallHandler(
                        (call, result) -> {

                            if (call.method.equals("actionCalcularSoma")) {
                                int valorA = call.argument("valorA");
                                int valorB = call.argument("valorB");

                                int resultado = somarValores(valorA, valorB);

                                result.success(resultado);
                            }

                            if (call.method.equals("actionCalcularTotal")) {
                                double salario = call.argument("salario");
                                double vendas = call.argument("vendas");

                                double resultado = calcularVendas(salario, vendas);

                                result.success(resultado);
                            }

                            if (call.method.equals("actionCalcularNotas")) {
                                int nota = call.argument("valor");

                                String resultado = calcularNotas(nota);

                                result.success(resultado);
                            }

                            if (call.method.equals("actionVerificarNota")) {
                                int nota = call.argument("nota");

                                String resultado = verificaNota(nota);

                                result.success(resultado);
                            }

                            if (call.method.equals("actionCalcularMedidas")) {
                                int altura = call.argument("altura");
                                int diametro = call.argument("diametro");
                                int galhos = call.argument("galhos");

                                String resultado = calculaMedidas(altura, diametro, galhos);

                                result.success(resultado);
                            }

                            result.notImplemented();
                        }
                );
    }

    private int somarValores(int valorA, int valorB) {
        return valorA + valorB;
    }

    private double calcularVendas(double salario, double vendas) {
        return salario + (vendas * 0.15);
    }

    @org.jetbrains.annotations.NotNull
    private String calcularNotas(int nota) {
        int notaInicial = nota;

        int qtd100, qtd50, qtd20, qtd10, qtd5, qtd2, qtd1;
        String retorno;

        qtd100 = (nota / 100);
        nota = nota % 100;
        qtd50 = (nota / 50);
        nota = nota % 50;
        qtd20 = (nota / 20);
        nota = nota % 20;
        qtd10 = (nota / 10);
        nota = nota % 10;
        qtd5 = (nota / 5);
        nota = nota % 5;
        qtd2 = (nota / 2);
        nota = nota % 2;
        qtd1 = nota;

        retorno =
                notaInicial + "\n" +
                        qtd100 + " nota(s) de R$ 100,00\n" +
                        qtd50 + " nota(s) de R$ 50,00\n" +
                        qtd20 + " nota(s) de R$ 20,00\n" +
                        qtd10 + " nota(s) de R$ 10,00\n" +
                        qtd5 + " nota(s) de R$ 5,00\n" +
                        qtd2 + " nota(s) de R$ 2,00\n" +
                        qtd1 + " nota(s) de R$ 1,00\n";

        return retorno;
    }

    private String verificaNota(int nota) {
        String retorno = "";
        if (nota == 0){
            retorno = "E";
        }
        if(nota > 0 && nota <= 35){
            retorno = "D";
        }
        if(nota > 35 && nota <= 60){
            retorno = "C";
        }
        if (nota > 35 && nota <= 60) {
            retorno = "C";
        }
        if (nota > 60 && nota <= 85) {
            retorno = "B";
        }
        if (nota > 85 && nota <= 100) {
            retorno = "A";
        }

        if (nota > 100) {
            retorno = "Informe uma nota menor que 100.";
        }

        return retorno;
    }

    private String calculaMedidas(int altura, int diametro, int galhos) {

        if ((altura >= 200 && altura <= 300) && (diametro >= 50) && (galhos >= 150)) {
            return "Sim";
        } else {
            return "Não";
        }
    }
}
