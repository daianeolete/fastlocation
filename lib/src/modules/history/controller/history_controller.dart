
import 'package:mobx/mobx.dart';

import '../../home/model/endereco_model.dart';
import '../../home/service/endereco_service.dart';

part 'history_controller.g.dart';

class HistoryController = _HistoryController with _$HistoryController;

abstract class _HistoryController with Store {
  final EnderecoService _service = EnderecoService();

  @observable
  bool carregando = false;

  @observable
  List<EnderecoModel> historico = [];

  @action
  Future<void> carregarHistorico() async {
    carregando = true;

    try {
      historico = await _service.buscarHistorico();
    } finally {
      carregando = false;
    }
  }

  @action
  Future<void> limparHistorico() async {
    await _service.limparHistorico();
    historico = [];
  }
}
