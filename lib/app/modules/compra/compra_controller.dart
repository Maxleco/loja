import 'package:loja/app/modules/produto/models/produto_model.dart';
import 'package:loja/app/shared/stores/carrinho/carrinho_store.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'compra_controller.g.dart';

@Injectable()
class CompraController = _CompraControllerBase with _$CompraController;

abstract class _CompraControllerBase with Store {
  final CarrinhoStore _carrinhoStore;

  void adicionarProdNoCarrinho(ProdutoModel produtoModel){
    _carrinhoStore.adicionarProdNoCarrinho(produtoModel);
  }

  _CompraControllerBase(this._carrinhoStore);
}
