
import '../model/endereco_model.dart';
import '../repositories/endereco_repository.dart';
import '../repositories/historico_repository.dart';

class EnderecoService {
  final EnderecoRepository _enderecoRepository = EnderecoRepository();
  final HistoricoRepository _historicoRepository = HistoricoRepository();

  // Busca um endereço pelo CEP e salva no histórico.
  Future<EnderecoModel?> buscarPorCep(String cep) async {
    final cepLimpo = cep.replaceAll(RegExp(r'\D'), '');

    if (cepLimpo.length != 8) {
      return null;
    }

    final endereco = await _enderecoRepository.buscarPorCep(cepLimpo);

    if (endereco != null) {
      await _historicoRepository.salvar(endereco);
    }

    return endereco;
  }

  // Busca endereços utilizando UF, cidade e logradouro.
  Future<List<EnderecoModel>> buscarPorEndereco({
    required String uf,
    required String cidade,
    required String logradouro,
  }) async {
    if (uf.trim().length != 2 ||
        cidade.trim().isEmpty ||
        logradouro.trim().isEmpty) {
      return [];
    }

    final enderecos = await _enderecoRepository.buscarPorEndereco(
      uf: uf.trim(),
      cidade: cidade.trim(),
      logradouro: logradouro.trim(),
    );

    for (final endereco in enderecos) {
      await _historicoRepository.salvar(endereco);
    }

    return enderecos;
  }

  // Recupera o histórico de consultas.
  Future<List<EnderecoModel>> buscarHistorico() async {
    return await _historicoRepository.buscarTodos();
  }

  // Limpa o histórico.
  Future<void> limparHistorico() async {
    await _historicoRepository.limpar();
  }
}
