import 'package:loja/app/modules/produto/models/produto_model.dart';
import 'package:mobx/mobx.dart';
part 'carrinho_model.g.dart';

class CarrinhoModel = _CarrinhoModelBase with _$CarrinhoModel;

abstract class _CarrinhoModelBase with Store {
  final ProdutoModel produto;

  @observable
  int quantidade;

  @computed
  int get quant => this.quantidade ?? 0;

  _CarrinhoModelBase({this.produto}){
    this.quantidade = 1;
  }

  @action
  void adicionar() {
    quantidade++;
  }

  @action
  void remover() {
    if(quantidade > 0)
      quantidade--;
  }
}
