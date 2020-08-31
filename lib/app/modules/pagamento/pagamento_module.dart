import 'pages/dados_endereco/dados_endereco_page.dart';
import 'pages/dados_pagamento/dados_pagamento_controller.dart';
import 'pages/dados_pagamento/dados_pagamento_page.dart';
import 'pages/pagamento_sucesso/pagamento_sucesso_controller.dart';
import 'pages/pagamento_sucesso/pagamento_sucesso_page.dart';
import 'stores/pagamento_store.dart';

import 'pages/dados_endereco/dados_endereco_controller.dart';
import 'pagamento_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'pagamento_page.dart';

class PagamentoModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => PagamentoController()),
        Bind((i) => DadosEnderecoController(i.get<PagamentoStore>())),
        Bind((i) => PagamentoSucessoController(i.get<PagamentoStore>())),
        Bind((i) => DadosPagamentoController(i.get<PagamentoStore>())),

        //Stores
        Bind((i) => PagamentoStore()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => PagamentoPage()),
        ModularRouter(
          "/endereco",
          child: (_, args) => DadosEnderecoPage(),
          transition: TransitionType.rightToLeft,
        ),
        ModularRouter(
          "/dadospagamento",
          child: (_, args) => DadosPagamentoPage(),
          transition: TransitionType.rightToLeft,
        ),
        ModularRouter("/sucesso", child: (_, args) => PagamentoSucessoPage()),
      ];

  static Inject get to => Inject<PagamentoModule>.of();
}
