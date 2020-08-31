import 'package:dio/dio.dart';
import 'package:loja/app/modules/produto/repository/produto_repository.dart';
import 'package:loja/app/shared/stores/auth/auth_store.dart';

import 'produto_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'produto_page.dart';

class ProdutoModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ProdutoController(
              i.get<ProdutoRepository>(),
              i.args.params["idLoja"],
              i.get<AuthStore>(),
            )),
        Bind((i) => ProdutoRepository(Dio())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          "/:nomeLoja/:logo/:idLoja",
          child: (_, args) => ProdutoPage(
            nomeDaLoja: args.params["nomeLoja"],
            id: args.params["idLoja"],
            logo: args.params["logo"],
          ),
          transition: TransitionType.fadeIn,
        ),
      ];

  static Inject get to => Inject<ProdutoModule>.of();
}
