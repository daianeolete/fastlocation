
import 'package:geocoding/geocoding.dart';
import 'package:map_launcher/map_launcher.dart';

import '../model/endereco_model.dart';

class RotaService {
  Future<bool> abrirRota(EnderecoModel endereco) async {
    try {
      final enderecoCompleto = [
        endereco.logradouro,
        endereco.bairro,
        endereco.localidade,
        endereco.uf,
        endereco.cep,
        'Brasil',
      ].where((parte) => parte.trim().isNotEmpty).join(', ');

      final locais = await locationFromAddress(enderecoCompleto);

      if (locais.isEmpty) {
        return false;
      }

      final local = locais.first;

      await MapLauncher.showDirections(
        mapType: MapType.google,
        destination: Coords(
          local.latitude,
          local.longitude,
        ),
        destinationTitle: endereco.logradouro,
        directionsMode: DirectionsMode.driving,
      );

      return true;
    } catch (e) {
      return false;
    }
  }
}
