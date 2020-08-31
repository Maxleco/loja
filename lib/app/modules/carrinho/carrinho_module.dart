import 'package:loja/app/shared/stores/auth/auth_store.dart';
import 'package:loja/app/shared/stores/carrinho/carrinho_store.dart';

import 'widgets/carrinho_lista_produtos/carrinho_lista_produtos_controller.dart';

import 'carrinho_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'carrinho_page.dart';
import 'widgets/carrinho_total/carrinho_total_controller.dart';

class CarrinhoModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => CarrinhoController(
            i.get<AuthStore>(),
            i.get<CarrinhoStore>(),
          )
        ),
        Bind((i) => CarrinhoListaProdutosController(i.get<CarrinhoStore>())),
        Bind((i) => CarrinhoTotalController(i.get<CarrinhoStore>())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          "/:title",
          child: (_, args) => CarrinhoPage(title: args.params["title"]),
        ),
      ];

  static Inject get to => Inject<CarrinhoModule>.of();
}
