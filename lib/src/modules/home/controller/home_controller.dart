
import 'package:mobx/mobx.dart';

import '../model/endereco_model.dart';
import '../service/endereco_service.dart';
import '../service/rota_service.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  final EnderecoService _service = EnderecoService();
  final RotaService _rotaService = RotaService();

  @observable
  bool carregando = false;

  @observable
  EnderecoModel? enderecoSelecionado;

  @observable
  List<EnderecoModel> resultados = [];

  @observable
  List<EnderecoModel> historico = [];

  @observable
  String? mensagem;

  @action
  Future<void> buscarPorCep(String cep) async {
    carregando = true;
    mensagem = null;
    enderecoSelecionado = null;
    resultados = [];

    try {
      final endereco = await _service.buscarPorCep(cep);

      if (endereco == null) {
        mensagem = 'Nenhum endereço encontrado. Verifique o CEP.';
      } else {
        enderecoSelecionado = endereco;
        resultados = [endereco];
      }
    } catch (e) {
      mensagem = 'Não foi possível consultar o CEP. Verifique sua conexão e tente novamente.';
    } finally {
      carregando = false;
    }
  }

  @action
  Future<void> buscarPorEndereco({
    required String uf,
    required String cidade,
    required String logradouro,
  }) async {
    carregando = true;
    mensagem = null;
    enderecoSelecionado = null;
    resultados = [];

    try {
      resultados = await _service.buscarPorEndereco(
        uf: uf,
        cidade: cidade,
        logradouro: logradouro,
      );

      if (resultados.isEmpty) {
        mensagem = 'Nenhum endereço encontrado.';
      } else {
        enderecoSelecionado = resultados.first;
      }
    } catch (e) {
      mensagem = 'Não foi possível consultar o endereço. Verifique sua conexão e tente novamente.';
    } finally {
      carregando = false;
    }
  }

  @action
  Future<void> carregarHistorico() async {
    historico = await _service.buscarHistorico();
  }

  @action
  Future<void> limparHistorico() async {
    await _service.limparHistorico();
    historico = [];
  }

  Future<bool> abrirRota() async {
    if (enderecoSelecionado == null) {
      return false;
    }

    return await _rotaService.abrirRota(enderecoSelecionado!);
  }
}
