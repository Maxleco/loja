import 'package:flutter/material.dart';
import 'package:loja/app/modules/produto/models/produto_model.dart';
import 'package:loja/app/shared/widgets/CustomButton.dart';

class CardInfProd extends StatelessWidget {
  final ProdutoModel produtoModel;
  final Function onPressed;

  CardInfProd({this.produtoModel, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: <Widget>[
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    produtoModel.nome,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Row(
                        children: List.generate(
                          5,
                          (index) {
                            return Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 15,
                            );
                          },
                        ),
                      ),
                      Text(
                        " (24)",
                        style: TextStyle(
                          color: Colors.amber,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "R\$ ${produtoModel.preco}",
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        "R\$ ${produtoModel.preco}",
                        style: TextStyle(
                          color: Colors.red[300],
                          fontSize: 18,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text("${produtoModel.descricao}"),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text("Cod: 0000${produtoModel.id}"),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            width: double.infinity,
            height: 40,
            child: CustomButton(
              text: "Adicionar ao Carrinho".toUpperCase(),
              textColor: Colors.white,
              onPressed: this.onPressed,
            ),
          ),
        ],
      ),
    );
  }
}
