
import 'package:material_ui/material_ui.dart';

import '../model/endereco_model.dart';
import '../../../shared/colors/app_colors.dart';
import '../../../shared/metrics/app_metrics.dart';

class EnderecoCard extends StatelessWidget {
  final EnderecoModel endereco;

  const EnderecoCard({
    super.key,
    required this.endereco,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: AppMetrics.small,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppMetrics.borderRadius,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppMetrics.medium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              endereco.logradouro.isEmpty
                  ? 'Endereço não informado'
                  : endereco.logradouro,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.text,
              ),
            ),
            const SizedBox(height: 8),
            Text('Bairro: ${endereco.bairro}'),
            Text(
              'Cidade: ${endereco.localidade} - ${endereco.uf}',
            ),
            Text('CEP: ${endereco.cep}'),
            if (endereco.complemento.isNotEmpty)
              Text('Complemento: ${endereco.complemento}'),
          ],
        ),
      ),
    );
  }
}
