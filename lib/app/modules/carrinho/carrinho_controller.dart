import 'package:flutter/material.dart';
import 'package:loja/app/shared/stores/auth/auth_store.dart';
import 'package:loja/app/shared/stores/carrinho/carrinho_store.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'carrinho_controller.g.dart';

@Injectable()
class CarrinhoController = _CarrinhoControllerBase with _$CarrinhoController;

abstract class _CarrinhoControllerBase with Store {
  final AuthStore authStore;
  final CarrinhoStore carrinhoStore;
  _CarrinhoControllerBase(this.authStore, this.carrinhoStore);

  void goPagamento(){
    if(authStore.isLogged){
      if(carrinhoStore.total > 0.0)
        Modular.to.pushReplacementNamed("/pagamento");
    }
    else{
      Modular.to.showDialog(
        builder: (_){
          return AlertDialog(
            title: Text("Oppss..."),
            content: Text("Você precisa está logado para seguir com o pagamento!"),
          );
        }
      );
    }
  }

}
