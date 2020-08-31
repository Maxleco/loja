import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:loja/app/shared/widgets/CustomButton.dart';
import 'package:loja/app/shared/widgets/CustomTextFields.dart';
import 'dados_pagamento_controller.dart';

class DadosPagamentoPage extends StatefulWidget {
  final String title;
  const DadosPagamentoPage({Key key, this.title = "Dados Pagamento"})
      : super(key: key);

  @override
  _DadosPagamentoPageState createState() => _DadosPagamentoPageState();
}

class _DadosPagamentoPageState
    extends ModularState<DadosPagamentoPage, DadosPagamentoController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        

        title: Text(widget.title),
      ),
      body: Column(        
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextFields(
                  label: "Cartão",
                  controller: controller.cartaoController,
                ),
                SizedBox(height: 20),
                CustomTextFields(
                  label: "CVV",
                  controller: controller.cvvController,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
            child: CustomButton(
              text: "Continuar",
              onPressed: controller.proximo,
            ),
          ),
        ],
      ),
    );
  }
}
