import 'package:conversor_imc_flutter/src/views/components/espacamento_h.dart';
import 'package:conversor_imc_flutter/src/views/components/espacamento_w.dart';
import 'package:conversor_imc_flutter/src/views/components/titulo2.dart';
import 'package:flutter/material.dart';

class CalcIMC extends StatefulWidget {
  @override
  _CalcIMCState createState() => _CalcIMCState();
}

class _CalcIMCState extends State<CalcIMC> {
  double peso = 0;
  double altura = 0;

  // Variável p/ controlar o campo de resultado:
  var resultado = TextEditingController();

  String resultadoText = '';
  String subresultado = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora IMC'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                EspacamentoH(h: 20),
                Image.asset(
                  'assets/images/icon_imc.png',
                  width: 200,
                  height: 200,
                ),
                // Container de espaçamento:
                EspacamentoH(h: 20),
                Titulo2(txt: "Calculadora IMC:"),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Peso:
                    Expanded(
                        flex: 1,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(labelText: 'Peso'),
                          onChanged: (value) {
                            peso = double.tryParse(value) ?? 0.00;
                            // Fazer as verificações:
                          },
                        )),
                    // Container de espaçamento:
                    EspacamentoW(w: 10),
                    // Altura
                    Expanded(
                      flex: 1,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(labelText: 'Altura'),
                        onChanged: (value) {
                          altura = double.tryParse(value) ?? 0.00;
                          // Fazer as verificações:
                        },
                      ),
                    ),
                  ],
                ),

                EspacamentoH(h: 20),

                ElevatedButton(
                    onPressed: () {
                      var novoValor;
                      novoValor = peso / (altura * altura);
                      if (novoValor < 18.5) {
                        subresultado = ("Peso abaixo ");
                      } else if ((novoValor > 18.5) && (novoValor < 25)) {
                        subresultado = ("Peso normal");
                      } else if ((novoValor > 25) && (novoValor < 30)) {
                        subresultado = ("Sobre o Peso");
                      } else if ((novoValor > 30) && (novoValor < 35)) {
                        subresultado = ("Obesidade Grau I");
                      } else if ((novoValor > 35) && (novoValor < 40)) {
                        subresultado = ("Obesidade Grau II");
                      } else if (novoValor > 40) {
                        subresultado = ("Obesidade Grau III");
                      }

                      // Atribuir o valor na variável controladora do campo de reusltado:
                      //resultado.text = novoValor.toStringAsFixed(2);
                      setState(() {
                        resultadoText = novoValor.toStringAsFixed(2);
                      });
                    },
                    child: Text("Calcular")),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Titulo2(txt: "RESULTADO: $resultadoText $subresultado "),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
