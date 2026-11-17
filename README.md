# FastLocation

Aplicativo mobile desenvolvido em Flutter para a empresa fictícia FastDelivery, com o objetivo de agilizar a consulta e a confirmação de endereços durante o processo de entrega de encomendas.

O FastLocation permite consultar endereços por CEP e localizar CEPs por meio de endereços completos ou parciais, utilizando a API pública ViaCEP.

## Funcionalidades

- **Consulta por CEP:** pesquisa de endereço informando o CEP.
- **Consulta por endereço:** busca de CEP utilizando UF, cidade e logradouro.
- **Exibição de resultados:** apresentação dos dados do endereço retornados pela API.
- **Indicador de carregamento:** feedback visual durante as consultas externas.
- **Tratamento de resultados não encontrados:** apresentação de mensagens quando a busca não retorna um endereço válido.
- **Tratamento de erros:** mensagens para situações de falha nas consultas.
- **Histórico de consultas:** armazenamento local dos endereços pesquisados.
- **Carregamento automático do histórico:** recuperação dos registros ao acessar a tela de histórico.
- **Limpeza do histórico:** possibilidade de excluir os registros armazenados.
- **Visualização de rotas:** abertura do Google Maps com a localização atual do dispositivo como origem e o último endereço consultado como destino.
- **Tela inicial animada:** apresentação de abertura com redirecionamento automático para a tela principal.

## Tecnologias e bibliotecas utilizadas

- **Flutter e Dart:** desenvolvimento do aplicativo mobile.
- **Dio:** comunicação HTTP com a API externa.
- **MobX:** gerenciamento de estado.
- **Flutter MobX:** integração do MobX com Flutter e utilização do Observer.
- **Hive e Hive Flutter:** armazenamento local dos dados.
- **Path e Path Provider:** suporte ao gerenciamento de caminhos e armazenamento.
- **Map Launcher:** abertura de aplicativos de mapas.
- **Geocoding:** conversão de endereços em coordenadas geográficas.
- **ViaCEP:** API pública para consulta de CEP e endereços.

### Dependências de desenvolvimento

- mobx_codegen
- build_runner
- hive_generator

## Organização do projeto

O código está organizado em módulos e estruturas compartilhadas, separando responsabilidades e facilitando a manutenção.

```text
lib/
├── main.dart
└── src/
    ├── http/
    ├── modules/
    │   ├── history/
    │   │   ├── controller/
    │   │   └── page/
    │   ├── home/
    │   │   ├── components/
    │   │   ├── controller/
    │   │   ├── model/
    │   │   ├── page/
    │   │   ├── repositories/
    │   │   └── service/
    │   └── initial/
    │       └── page/
    ├── routes/
    └── shared/
        ├── colors/
        ├── metrics/
        └── storage/
```

## API utilizada

**ViaCEP**

A aplicação utiliza a API pública ViaCEP para consultar endereços a partir de um CEP e localizar CEPs a partir de informações de endereço.

Documentação: https://viacep.com.br/

## Como executar o projeto

### Pré-requisitos

- Flutter instalado e configurado.
- Android Studio ou ambiente compatível com Flutter.
- Emulador Android ou dispositivo Android físico.
- Conexão com a internet.

### Passo a passo

1. Clone o repositório:

```bash
git clone https://github.com/daianeolete/fastlocation.git
```

2. Acesse a pasta do projeto:

```bash
cd fastlocation
```

3. Instale as dependências:

```bash
flutter pub get
```

4. Execute o aplicativo:

```bash
flutter run
```

### Observações

- É necessário ter conexão com a internet para realizar consultas à API ViaCEP.
- Para utilizar a funcionalidade de rotas, permita o acesso à localização do dispositivo.
- O Google Maps deve estar disponível no dispositivo para abertura das rotas.

## Desenvolvedoras

- **Daiane Olete da Silva Maniçoba**
- **Fabíola Reginaldo Corrêa da Silva**

Curso: Análise e Desenvolvimento de Sistemas (ADS).

Projeto acadêmico desenvolvido para o **Desafio 2 – Desenvolvimento de Sistemas Móveis**.