import 'package:dio/dio.dart';
import 'package:loja/app/modules/loja/repository/loja_repository.dart';
import 'package:loja/app/shared/stores/auth/auth_store.dart';

import 'loja_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'loja_page.dart';

class LojaModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => LojaController(i.get<LojaRepository>(), i.get<AuthStore>())),
        Bind((i) => LojaRepository(Dio())),

      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => LojaPage()),
      ];

  static Inject get to => Inject<LojaModule>.of();
}
