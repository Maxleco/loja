import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:loja/app/shared/widgets/CustomButton.dart';
import 'pagamento_sucesso_controller.dart';

class PagamentoSucessoPage extends StatefulWidget {
  final String title;
  const PagamentoSucessoPage({Key key, this.title = "Pagamento Sucesso"})
      : super(key: key);

  @override
  _PagamentoSucessoPageState createState() => _PagamentoSucessoPageState();
}

class _PagamentoSucessoPageState
    extends ModularState<PagamentoSucessoPage, PagamentoSucessoController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Pagamento Finalizado com sucesso ${controller.model.nome}!!!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30),
            ),
            Container(
              width: double.infinity,
              child: CustomButton(
                text: "Continuar Comprando",
                onPressed: () {
                  Modular.to.popUntil(ModalRoute.withName("/"));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
