import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'pagamento_controller.g.dart';

@Injectable()
class PagamentoController = _PagamentoControllerBase with _$PagamentoController;

abstract class _PagamentoControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
