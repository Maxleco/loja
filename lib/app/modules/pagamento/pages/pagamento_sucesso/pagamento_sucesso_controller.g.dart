// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagamento_sucesso_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $PagamentoSucessoController = BindInject(
  (i) => PagamentoSucessoController(i<PagamentoStore>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PagamentoSucessoController on _PagamentoSucessoControllerBase, Store {
  Computed<PagamentoModel> _$modelComputed;

  @override
  PagamentoModel get model =>
      (_$modelComputed ??= Computed<PagamentoModel>(() => super.model,
              name: '_PagamentoSucessoControllerBase.model'))
          .value;

  @override
  String toString() {
    return '''
model: ${model}
    ''';
  }
}
