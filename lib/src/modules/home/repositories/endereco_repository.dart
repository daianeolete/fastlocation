
import 'package:dio/dio.dart';

import '../../../http/dio_client.dart';
import '../model/endereco_model.dart';

class EnderecoRepository {
  final Dio _dio = DioClient.create();

  // Busca um endereço pelo CEP.
  Future<EnderecoModel?> buscarPorCep(String cep) async {
    final response = await _dio.get('/$cep/json/');

    if (response.data == null || response.data['erro'] == true) {
      return null;
    }

    return EnderecoModel.fromJson(response.data);
  }

  // Busca endereços utilizando UF, cidade e logradouro.
  Future<List<EnderecoModel>> buscarPorEndereco({
    required String uf,
    required String cidade,
    required String logradouro,
  }) async {
    final response = await _dio.get(
      '/$uf/${Uri.encodeComponent(cidade)}/${Uri.encodeComponent(logradouro)}/json/',
    );

    if (response.data == null || response.data is! List) {
      return [];
    }

    return (response.data as List)
        .map((item) => EnderecoModel.fromJson(item))
        .toList();
  }
}
