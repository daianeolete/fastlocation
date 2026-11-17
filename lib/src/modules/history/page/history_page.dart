
import 'package:material_ui/material_ui.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../controller/history_controller.dart';
import '../../home/components/endereco_card.dart';
import '../../../shared/colors/app_colors.dart';
import '../../../shared/metrics/app_metrics.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final HistoryController _controller = HistoryController();

  @override
  void initState() {
    super.initState();
    _controller.carregarHistorico();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Histórico de pesquisas'),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline),
            tooltip: 'Limpar histórico',
            onPressed: () async {
              await _controller.limparHistorico();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppMetrics.medium),
        child: Observer(
          builder: (_) {
            if (_controller.carregando) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (_controller.historico.isEmpty) {
              return const Center(
                child: Text('Nenhum endereço pesquisado ainda.'),
              );
            }

            return ListView.builder(
              itemCount: _controller.historico.length,
              itemBuilder: (context, index) {
                final endereco = _controller.historico[index];

                return EnderecoCard(endereco: endereco);
              },
            );
          },
        ),
      ),
    );
  }
}
