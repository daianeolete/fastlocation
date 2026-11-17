
import 'package:material_ui/material_ui.dart';

import '../model/endereco_model.dart';
import 'endereco_card.dart';

class EnderecoLista extends StatelessWidget {
  final List<EnderecoModel> enderecos;

  const EnderecoLista({
    super.key,
    required this.enderecos,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: enderecos
          .map((endereco) => EnderecoCard(endereco: endereco))
          .toList(),
    );
  }
}
