import 'package:loja/app/shared/stores/carrinho/carrinho_store.dart';

import 'compra_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'compra_page.dart';

class CompraModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CompraController(i.get<CarrinhoStore>())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          Modular.initialRoute,
          child: (_, args) => CompraPage(produtoModel: args.data),
        ),
        
      ];

  static Inject get to => Inject<CompraModule>.of();
}
