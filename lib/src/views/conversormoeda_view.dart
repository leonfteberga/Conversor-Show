import 'package:conversor_imc_flutter/src/views/components/espacamento_h.dart';
import 'package:conversor_imc_flutter/src/views/components/espacamento_w.dart';
import 'package:conversor_imc_flutter/src/views/components/titulo2.dart';
import 'package:flutter/material.dart';

class ConversorMoeda extends StatefulWidget {
  @override
  _ConversorMoedaState createState() => _ConversorMoedaState();
}

class _ConversorMoedaState extends State<ConversorMoeda> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                  print(value);
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
                            DropdownMenuItem(value: 'EUR', child: Text('EUR')),
                            DropdownMenuItem(value: 'BTC', child: Text('BTC')),
                          ],
                          onChanged: (value) {},
                        ),
                      )),
                  // Container de espaçamento:
                  EspacamentoW(w: 10),
                  // TextField
                  Expanded(
                    flex: 2,
                    child: TextField(
                      decoration: InputDecoration(),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
