import 'package:loja/app/shared/models/usuario/usuario_model.dart';
import 'package:mobx/mobx.dart';
part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  @observable
  UsuarioModel user;

  @action
  setUser(UsuarioModel value) => user = value;

  @computed
  bool get isLogged {
    if(user == null){
      return false;
    } else {
      return user.email != null && user.senha != null;
    }
  }
}