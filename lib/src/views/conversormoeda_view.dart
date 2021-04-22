import 'package:conversor_imc_flutter/src/views/components/drawer.dart';
import 'package:conversor_imc_flutter/src/views/components/espacamento_h.dart';
import 'package:conversor_imc_flutter/src/views/components/espacamento_w.dart';
import 'package:conversor_imc_flutter/src/views/components/titulo2.dart';
import 'package:flutter/material.dart';

class ConversorMoeda extends StatefulWidget {
  @override
  _ConversorMoedaState createState() => _ConversorMoedaState();
}

class _ConversorMoedaState extends State<ConversorMoeda> {
  // Valores das moedas:
  double usd = 5.60;
  double eur = 6.70;
  double btc = 320156.14;

  double real = 0;
  // Variavel p/ controlar o dropdown:
  String moedaSelecionada = 'USD';
  // Variável p/ controlar o campo de resultado:
  var resultado = TextEditingController();

  String resultadoText = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: DrawerInicio(),
      appBar: AppBar(
        title: Text('Conversor de Moeda'),
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
                  'assets/images/icon_conversor.png',
                  width: 200,
                  height: 200,
                ),
                // Container de espaçamento:
                EspacamentoH(h: 20),
                Titulo2(txt: "Conversor de Moeda:"),
                // Campo de entrada de moeda:
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Valor em R\$',
                  ),
                  onChanged: (value) {
                    real = double.tryParse(value) ?? 0.00;
                    // Fazer as verificações:
                  },
                ),
                // Linha com os campos de resultado:
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Dropdown:
                    Expanded(
                        flex: 1,
                        child: SizedBox(
                          height: 56,
                          // Item do dropdown:
                          child: DropdownButton(
                            value: moedaSelecionada,
                            isExpanded: true,
                            iconEnabledColor: Colors.pink,
                            underline: Container(
                              height: 1,
                              color: Colors.pink,
                            ),
                            items: [
                              DropdownMenuItem(
                                value: 'USD',
                                child: Text('USD'),
                              ),
                              DropdownMenuItem(
                                  value: 'EUR', child: Text('EUR')),
                              DropdownMenuItem(
                                  value: 'BTC', child: Text('BTC')),
                            ],
                            onChanged: (value) {
                              setState(() {
                                moedaSelecionada = value.toString();
                              });
                              //print(moedaSelecionada);
                            },
                          ),
                        )),

                    /*TextField(
                        enabled: false,
                        controller: resultado,
                        decoration: InputDecoration(),
                      ),*/
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      var novoValor;
                      if (moedaSelecionada == 'USD') {
                        novoValor = real / usd;
                      } else if (moedaSelecionada == 'EUR') {
                        novoValor = real / eur;
                      } else if (moedaSelecionada == 'BTC') {
                        novoValor = real / btc;
                      }
                      // Atribuir o valor na variável controladora do campo de reusltado:
                      //resultado.text = novoValor.toStringAsFixed(2);
                      setState(() {
                        resultadoText = novoValor.toStringAsFixed(2);
                      });
                    },
                    child: Text("Converter")),
                Titulo2(
                  txt: "Resultado:  $resultadoText $moedaSelecionada",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}