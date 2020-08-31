import 'package:loja/app/modules/produto/models/produto_model.dart';
import 'package:loja/app/shared/models/carrinho/carrinho_model.dart';
import 'package:mobx/mobx.dart';
part 'carrinho_store.g.dart';

class CarrinhoStore = _CarrinhoStoreBase with _$CarrinhoStore;

abstract class _CarrinhoStoreBase with Store {
  var produtosNoCarrinho = ObservableList<CarrinhoModel>();

  void adicionarProdNoCarrinho(ProdutoModel produtoModel) {
    int index = produtosNoCarrinho
        .indexWhere((prodCar) => prodCar.produto.id == produtoModel.id);
    if (index >= 0) {
      produtosNoCarrinho.elementAt(index).adicionar();
    } else {
      var produto = CarrinhoModel(produto: produtoModel);
      produtosNoCarrinho.add(produto);
    }
  }

  @computed
  double get total {
    double soma = 0.0;
    for(var item in this.produtosNoCarrinho){
      soma += (double.parse(item.produto.preco.replaceAll(",", ".")) * item.quantidade);
    }
    return soma;
    // return produtosNoCarrinho
    //     .map((item) =>
    //         double.parse(item.produto.preco.replaceAll(",", ".")) *
    //         item.quantidade)
    //     .toList()
    //     .reduce((value, element) => value + element);
  }
}
