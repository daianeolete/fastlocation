class EnderecoModel {
  final String cep;
  final String logradouro;
  final String complemento;
  final String bairro;
  final String localidade;
  final String uf;
  final String estado;
  final String regiao;
  final String ibge;
  final String ddd;

  EnderecoModel({
    required this.cep,
    required this.logradouro,
    required this.complemento,
    required this.bairro,
    required this.localidade,
    required this.uf,
    required this.estado,
    required this.regiao,
    required this.ibge,
    required this.ddd,
  });

  factory EnderecoModel.fromJson(Map<String, dynamic> json) {
    return EnderecoModel(
      cep: json['cep'] ?? '',
      logradouro: json['logradouro'] ?? '',
      complemento: json['complemento'] ?? '',
      bairro: json['bairro'] ?? '',
      localidade: json['localidade'] ?? '',
      uf: json['uf'] ?? '',
      estado: json['estado'] ?? '',
      regiao: json['regiao'] ?? '',
      ibge: json['ibge'] ?? '',
      ddd: json['ddd'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cep': cep,
      'logradouro': logradouro,
      'complemento': complemento,
      'bairro': bairro,
      'localidade': localidade,
      'uf': uf,
      'estado': estado,
      'regiao': regiao,
      'ibge': ibge,
      'ddd': ddd,
    };
  }
}