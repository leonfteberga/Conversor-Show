import 'package:conversor_imc_flutter/src/views/conversormoeda_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Conversor Show"),
        ),
        body: ConversorMoeda());
  }
}
