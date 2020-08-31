import 'package:loja/app/modules/loja/repository/loja_repository.dart';
import 'package:loja/app/shared/stores/auth/auth_store.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'models/loja_model.dart';

part 'loja_controller.g.dart';

@Injectable()
class LojaController = _LojaControllerBase with _$LojaController;

abstract class _LojaControllerBase with Store {
  final AuthStore _authStore;
  final LojaRepository repository;

  _LojaControllerBase(this.repository, this._authStore) {
    init();
  }

  @computed
  bool get isLogged => _authStore.isLogged;

  @observable
  ObservableList<LojaModel> lojas;

  @action
  Future init() async {
    lojas = (await repository.obterLojas()).asObservable();
  }
}