import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:loja/app/modules/compra/widgets/CardInfProd.dart';
import 'package:loja/app/modules/produto/models/produto_model.dart';
import 'compra_controller.dart';

class CompraPage extends StatefulWidget {
  final ProdutoModel produtoModel;
  const CompraPage({Key key, @required this.produtoModel}) : super(key: key);

  @override
  _CompraPageState createState() => _CompraPageState();
}

class _CompraPageState extends ModularState<CompraPage, CompraController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.produtoModel.nome),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              child: Image.network(
                widget.produtoModel.imagem,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            CardInfProd(
              produtoModel: widget.produtoModel,
              onPressed: () {
                controller.adicionarProdNoCarrinho(widget.produtoModel);
                Modular.to.pushNamed("/carrinho/Vindo da Compra");
              },
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
