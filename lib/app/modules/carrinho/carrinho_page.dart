import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:loja/app/modules/carrinho/widgets/carrinho_total/carrinho_total_widget.dart';
import 'package:loja/app/shared/widgets/CustomButton.dart';
import 'widgets/carrinho_lista_produtos/carrinho_lista_produtos_widget.dart';
import 'carrinho_controller.dart';

class CarrinhoPage extends StatefulWidget {
  final String title;
  const CarrinhoPage({Key key, @required this.title}) : super(key: key);

  @override
  _CarrinhoPageState createState() => _CarrinhoPageState();
}

class _CarrinhoPageState
    extends ModularState<CarrinhoPage, CarrinhoController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    print(widget.title);
    return Scaffold(
      appBar: AppBar(
        title: Text("Carrinho de Compras"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: CarrinhoListaProdutosWidget(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: CarrinhoTotalWidget(),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              child: CustomButton(
                text: "Ir para o Pagamento",
                onPressed: controller.goPagamento,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
