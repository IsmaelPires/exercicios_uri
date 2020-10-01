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

                            if (call.method.equals("actionCalcularSoma")){
                                int valorA = call.argument("valorA");
                                int valorB = call.argument("valorB");

                                int resultado = somarValores(valorA, valorB);

                                result.success(resultado);
                            }

                            if (call.method.equals("actionCalcularTotal")){
                                double salario = call.argument("salario");
                                double vendas = call.argument("vendas");

                                double resultado = calcularVendas(salario, vendas);

                                result.success(resultado);
                            }

                            if (call.method.equals("actionCalcularNotas")){
                                int valor = call.argument("valor");
                                
                                String resultado[] = new String[7];

                                int limitador = 10;
                                String array[] = new String[limitador];

                                for(int x = 0; x < limitador; x++) {
                                    var valor
	                                array[x] = valor;

                                }

                                
                                result.success(resultado);
                            }

                            result.notImplemented();
                        }
                );
    }

    private int somarValores (int valorA, int valorB) {
        return valorA + valorB;
    }

    private double calcularVendas (double salario, double vendas) {
        return salario + (vendas*0.15);
    }

    private String[] calcularNotas (int valor) {


        return salario + (vendas*0.15);
    }
}
