
import 'package:material_ui/material_ui.dart';

import '../model/endereco_model.dart';
import 'endereco_card.dart';

class UltimoEndereco extends StatelessWidget {
  final EnderecoModel? endereco;

  const UltimoEndereco({
    super.key,
    required this.endereco,
  });

  @override
  Widget build(BuildContext context) {
    if (endereco == null) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Último endereço consultado',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        EnderecoCard(endereco: endereco!),
      ],
    );
  }
}
