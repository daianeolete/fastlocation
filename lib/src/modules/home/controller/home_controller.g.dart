// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeController, Store {
  late final _$carregandoAtom =
      Atom(name: '_HomeController.carregando', context: context);

  @override
  bool get carregando {
    _$carregandoAtom.reportRead();
    return super.carregando;
  }

  @override
  set carregando(bool value) {
    _$carregandoAtom.reportWrite(value, super.carregando, () {
      super.carregando = value;
    });
  }

  late final _$enderecoSelecionadoAtom =
      Atom(name: '_HomeController.enderecoSelecionado', context: context);

  @override
  EnderecoModel? get enderecoSelecionado {
    _$enderecoSelecionadoAtom.reportRead();
    return super.enderecoSelecionado;
  }

  @override
  set enderecoSelecionado(EnderecoModel? value) {
    _$enderecoSelecionadoAtom.reportWrite(value, super.enderecoSelecionado, () {
      super.enderecoSelecionado = value;
    });
  }

  late final _$resultadosAtom =
      Atom(name: '_HomeController.resultados', context: context);

  @override
  List<EnderecoModel> get resultados {
    _$resultadosAtom.reportRead();
    return super.resultados;
  }

  @override
  set resultados(List<EnderecoModel> value) {
    _$resultadosAtom.reportWrite(value, super.resultados, () {
      super.resultados = value;
    });
  }

  late final _$historicoAtom =
      Atom(name: '_HomeController.historico', context: context);

  @override
  List<EnderecoModel> get historico {
    _$historicoAtom.reportRead();
    return super.historico;
  }

  @override
  set historico(List<EnderecoModel> value) {
    _$historicoAtom.reportWrite(value, super.historico, () {
      super.historico = value;
    });
  }

  late final _$mensagemAtom =
      Atom(name: '_HomeController.mensagem', context: context);

  @override
  String? get mensagem {
    _$mensagemAtom.reportRead();
    return super.mensagem;
  }

  @override
  set mensagem(String? value) {
    _$mensagemAtom.reportWrite(value, super.mensagem, () {
      super.mensagem = value;
    });
  }

  late final _$buscarPorCepAsyncAction =
      AsyncAction('_HomeController.buscarPorCep', context: context);

  @override
  Future<void> buscarPorCep(String cep) {
    return _$buscarPorCepAsyncAction.run(() => super.buscarPorCep(cep));
  }

  late final _$buscarPorEnderecoAsyncAction =
      AsyncAction('_HomeController.buscarPorEndereco', context: context);

  @override
  Future<void> buscarPorEndereco(
      {required String uf,
      required String cidade,
      required String logradouro}) {
    return _$buscarPorEnderecoAsyncAction.run(() => super
        .buscarPorEndereco(uf: uf, cidade: cidade, logradouro: logradouro));
  }

  late final _$carregarHistoricoAsyncAction =
      AsyncAction('_HomeController.carregarHistorico', context: context);

  @override
  Future<void> carregarHistorico() {
    return _$carregarHistoricoAsyncAction.run(() => super.carregarHistorico());
  }

  late final _$limparHistoricoAsyncAction =
      AsyncAction('_HomeController.limparHistorico', context: context);

  @override
  Future<void> limparHistorico() {
    return _$limparHistoricoAsyncAction.run(() => super.limparHistorico());
  }

  @override
  String toString() {
    return '''
carregando: ${carregando},
enderecoSelecionado: ${enderecoSelecionado},
resultados: ${resultados},
historico: ${historico},
mensagem: ${mensagem}
    ''';
  }
}
