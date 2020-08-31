import 'package:loja/app/modules/pagamento/models/pagamento_model.dart';
import 'package:mobx/mobx.dart';
part 'pagamento_store.g.dart';

class PagamentoStore = _PagamentoStoreBase with _$PagamentoStore;

abstract class _PagamentoStoreBase with Store {
  @observable
  PagamentoModel pagamento = PagamentoModel();
}