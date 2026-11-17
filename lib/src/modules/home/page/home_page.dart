
import 'package:material_ui/material_ui.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../controller/home_controller.dart';
import '../components/endereco_lista.dart';
import '../components/ultimo_endereco.dart';
import '../components/busca_vazia.dart';
import '../../../shared/colors/app_colors.dart';
import '../../../shared/metrics/app_metrics.dart';
import '../../../routes/app_routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = HomeController();

  final TextEditingController _cepController = TextEditingController();
  final TextEditingController _ufController = TextEditingController();
  final TextEditingController _cidadeController = TextEditingController();
  final TextEditingController _logradouroController = TextEditingController();

  late final ReactionDisposer _mensagemReaction;

  @override
  void initState() {
    super.initState();

    _mensagemReaction = reaction<String?>(
      (_) => _controller.mensagem,
      (mensagem) {
        if (mensagem != null &&
            mensagem.startsWith('Não foi possível')) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!mounted) return;

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(mensagem)),
            );
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _mensagemReaction();
    _cepController.dispose();
    _ufController.dispose();
    _cidadeController.dispose();
    _logradouroController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FastLocation'),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            tooltip: 'Histórico de pesquisas',
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.history);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppMetrics.medium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Encontre um endereço',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.text,
              ),
            ),
            const SizedBox(height: AppMetrics.medium),

            const Text(
              'Pesquisar pelo CEP',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppMetrics.small),

            TextField(
              controller: _cepController,
              keyboardType: TextInputType.number,
              maxLength: 8,
              decoration: const InputDecoration(
                labelText: 'Digite o CEP',
                hintText: 'Ex.: 01001000',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.location_on),
                counterText: '',
              ),
            ),
            const SizedBox(height: AppMetrics.small),

            SizedBox(
              width: double.infinity,
              height: AppMetrics.buttonHeight,
              child: ElevatedButton(
                onPressed: () {
                  _controller.buscarPorCep(_cepController.text);
                },
                child: const Text('Buscar CEP'),
              ),
            ),

            const SizedBox(height: AppMetrics.large),
            const Divider(),
            const SizedBox(height: AppMetrics.medium),

            const Text(
              'Pesquisar pelo endereço',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppMetrics.small),

            TextField(
              controller: _ufController,
              maxLength: 2,
              textCapitalization: TextCapitalization.characters,
              decoration: const InputDecoration(
                labelText: 'Estado (UF)',
                hintText: 'Ex.: SC',
                border: OutlineInputBorder(),
                counterText: '',
              ),
            ),
            const SizedBox(height: AppMetrics.small),

            TextField(
              controller: _cidadeController,
              decoration: const InputDecoration(
                labelText: 'Cidade',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: AppMetrics.small),

            TextField(
              controller: _logradouroController,
              decoration: const InputDecoration(
                labelText: 'Rua ou logradouro',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: AppMetrics.small),

            SizedBox(
              width: double.infinity,
              height: AppMetrics.buttonHeight,
              child: ElevatedButton(
                onPressed: () {
                  _controller.buscarPorEndereco(
                    uf: _ufController.text,
                    cidade: _cidadeController.text,
                    logradouro: _logradouroController.text,
                  );
                },
                child: const Text('Buscar endereço'),
              ),
            ),

            const SizedBox(height: AppMetrics.large),
            const Divider(),
            const SizedBox(height: AppMetrics.medium),

            const Text(
              'Resultado da pesquisa',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppMetrics.small),

            Observer(
              builder: (_) {
                if (_controller.carregando) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (_controller.mensagem != null) {
                  return BuscaVazia(
                    mensagem: _controller.mensagem!,
                  );
                }

                if (_controller.resultados.isEmpty) {
                  return const BuscaVazia();
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UltimoEndereco(
                      endereco: _controller.enderecoSelecionado,
                    ),
                    EnderecoLista(
                      enderecos: _controller.resultados.skip(1).toList(),
                    ),
                    if (_controller.enderecoSelecionado != null) ...[
                      const SizedBox(height: AppMetrics.medium),
                      SizedBox(
                        width: double.infinity,
                        height: AppMetrics.buttonHeight,
                        child: ElevatedButton.icon(
                          icon: const Icon(Icons.directions),
                          label: const Text('Traçar rota'),
                          onPressed: () async {
                            final messenger =
                                ScaffoldMessenger.of(context);

                            final abriu = await _controller.abrirRota();

                            if (!mounted) return;

                            if (!abriu) {
                              messenger.showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Não foi possível abrir a rota. Verifique o endereço e tente novamente.',
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
