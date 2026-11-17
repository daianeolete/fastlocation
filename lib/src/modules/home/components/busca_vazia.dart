
import 'package:material_ui/material_ui.dart';

class BuscaVazia extends StatelessWidget {
  final String mensagem;

  const BuscaVazia({
    super.key,
    this.mensagem = 'Faça uma pesquisa para visualizar os endereços.',
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.search_off,
              size: 48,
              color: Colors.grey,
            ),
            const SizedBox(height: 12),
            Text(
              mensagem,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
