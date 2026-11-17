
import 'package:hive_flutter/hive_flutter.dart';

import '../model/endereco_model.dart';

class HistoricoRepository {
  static const String _boxName = 'historico';

  Future<Box> _abrirBox() async {
    if (Hive.isBoxOpen(_boxName)) {
      return Hive.box(_boxName);
    }

    return await Hive.openBox(_boxName);
  }

  Future<void> salvar(EnderecoModel endereco) async {
    final box = await _abrirBox();

    await box.add(endereco.toJson());
  }

  Future<List<EnderecoModel>> buscarTodos() async {
    final box = await _abrirBox();

    return box.values
        .map(
          (item) => EnderecoModel.fromJson(
            Map<String, dynamic>.from(item),
          ),
        )
        .toList()
        .reversed
        .toList();
  }

  Future<void> limpar() async {
    final box = await _abrirBox();

    await box.clear();
  }
}
