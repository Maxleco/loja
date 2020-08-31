import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:loja/app/modules/pagamento/models/pagamento_model.dart';
import 'package:loja/app/shared/widgets/CustomButton.dart';
import 'pagamento_controller.dart';

class PagamentoPage extends StatefulWidget {
  final String title;
  const PagamentoPage({Key key, this.title = "Dados Comprador"}) : super(key: key);

  @override
  _PagamentoPageState createState() => _PagamentoPageState();
}

class _PagamentoPageState
    extends ModularState<PagamentoPage, PagamentoController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(          
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Vamos Precisar de mais Alguns dados!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30),
            ),
            Container(
              width: double.infinity,
              child: CustomButton(
                text: "Continuar",
                onPressed: (){
                  Modular.to
                      .pushReplacementNamed("/pagamento/endereco");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
