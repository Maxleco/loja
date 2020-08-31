import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:loja/app/modules/produto/widgets/ItemProd.dart';
import '../../shared/utils/colors.dart';
import 'produto_controller.dart';

class ProdutoPage extends StatefulWidget {
  final String nomeDaLoja;
  final String id;
  final String logo;
  const ProdutoPage({Key key, @required this.nomeDaLoja, this.id, this.logo})
      : super(key: key);

  @override
  _ProdutoPageState createState() => _ProdutoPageState();
}

class _ProdutoPageState extends ModularState<ProdutoPage, ProdutoController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/${widget.logo}"),
            ),
            SizedBox(
              width: 20,
            ),
            Text(widget.nomeDaLoja),
          ],
        ),
      ),
      body: Observer(
        builder: (_) {
          return GridView.builder(
            itemCount: controller.produtos?.length ?? 0,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: .7,
            ),
            itemBuilder: (_, int index) {
              var currentItem = controller.produtos[index];

              return ItemProd(currentItem);
            },
          );
        },
      ),
      floatingActionButton: Observer(builder: (_) {
        if (controller.isLogged) {
          return FloatingActionButton(
            onPressed: () {
              Modular.to.pushNamed("/carrinho/Vindo da Compra");
            },
            backgroundColor: PRIMARY_COLOR,
            child: Icon(Icons.shopping_cart),
          );
        } else {
          return FloatingActionButton(
            backgroundColor: Colors.red,
            onPressed: () {
              Modular.to.pushNamed("/login");
            },
            child: Icon(Icons.person),
          );
        }
      }),
    );
  }
}
