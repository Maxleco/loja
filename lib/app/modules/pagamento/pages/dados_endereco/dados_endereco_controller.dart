import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:loja/app/modules/pagamento/models/pagamento_model.dart';
import 'package:loja/app/modules/pagamento/stores/pagamento_store.dart';
import 'package:mobx/mobx.dart';
part 'dados_endereco_controller.g.dart';

class DadosEnderecoController = _DadosEnderecoControllerBase with _$DadosEnderecoController;

abstract class _DadosEnderecoControllerBase extends Disposable with Store {
  final PagamentoStore _pagamentoStore;
  _DadosEnderecoControllerBase(this._pagamentoStore);

  @computed
  PagamentoModel get model => _pagamentoStore.pagamento;

  var ruaController = TextEditingController();
  var numeroController = TextEditingController();

  @action
  void proximo(){
    model.rua = ruaController.text;
    model.numero = ruaController.text;
    Modular.to.pushNamed("/pagamento/dadospagamento");
  }

  @override
  void dispose() {
    ruaController.dispose();
    numeroController.dispose();
  } 
}


