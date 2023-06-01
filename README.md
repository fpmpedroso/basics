# BASICS

Projeto que pretende compilar todas as funções e explicações básicas para criação de um App em Dart/Flutter sem mistério, indo direto ao ponto.
Reune eficiência e gerenciamento de memória, mas sem perder aquilo que o nome traz: "Basics", ou seja, a forma mais fácil e metódica para que se padronize um aplicativo.

## Gerencimaneto e Dependências e Estado

Foi utilizado Provider. Para garantir facilidade e eficiência no gerencimento de memória, encontra-se uma estrutura baseada em módulos.

## Ferramentas utilizadas

- provider: ^6.0.5;
- fonte padrão: Lora;
- fonte do logotipo: FiraCode;
- estrutura do loader: loading_animation_widget ^1.2.0+4;
- estrutura do snackbar: top_snackbar_flutter ^3.0.0+1;
- personalização do log: logger ^1.3.0;
- validação de formulários: validatorless ^1.2.3;
- modificação do splash screen: flutter_native_splash ^2.2.19;
- modificação do ícone do App: flutter_launcher_icons ^0.13.1;
- driver de conexão com banco de dados sqlite: sqflite ^2.2.8+4;
- recuperação da path do banco de dados em cada dispositivo: path ^1.8.3;
- formatação de datas: intl ^0.17.0;


## tarefas
- entender o projeto;
- assets;
- arquitetura de módulos;
- configuração dos estilos;
- configuração do tema;
- criação de componentes;
- helpers;
- splash page;
- 


## passo-a-passo
- importação/instalação de provider: ^6.0.5;
- criação da pasta /app;
- criação do arquivo /app/app_module.dart;
- criação do arquivo /app/app_widget.dart;
- criação do arquivo /app/modules/splash/splash_page.dart;
- criação da pasta /app/core/modules;
- criação do arquivo /app/core/modules/projeto_module.dart;
- criação do arquivo /app/core/modules/projeto_page.dart;
- adaptação do arquivo main.dart;
- run pela primeira vez;
- cria-se a pasta /app/core/ui/;
- cria-se o arquivo /app/core/ui/helpers/size_extensions.dart;
- cria-se o arquivo /app/core/ui/styles/colors_app.dart;
- cria-se o arquivo /app/core/ui/styles/buttons_app.dart;
- cria-se o arquivo /app/core/ui/theme/theme_app.dart;
- carregamento do ThemeApp no AppWidget;
- cria-se o arquivo /app/core/ui/widgets/app_bar_widget.dart;
- cria-se o arquivo /app/core/ui/widgets/button_widget.dart;
- cria-se o arquivo /app/core/ui/widgets/rounded_button.dart;
- criação da pasta assets/fonts;
- importação/instalação da fonte padrão do projeto;
- criação e configuração da pasta assets/images;
- importação do arquivo png img_logo.png;
- configura-se o módulo (rotas e dependências);
- cria-se o arquivo /app/modules/home/home_page.dart;
- cria-se o arquivo /app/modules/home/home_controller.dart;
- cria-se o arquivo /app/modules/home/home_module.dart
- configura-se a nova rota Home;
- importas-se o loader loading_animation_widget;
- cria-se o arquivo /app/core/ui/helpers/load.dart;
- insere o mixin na splash_page.dart ("with Loader");
- importa-se o snackbar top_snackbar_flutter;
- cria-se o arquivo /app/core/ui/helpers/messages.dart;
- insere-se o mixin na splash_page.dart ("with...");
- configura-se o logger;
- configuração do novo módulo presentations;
- criação do arquivo /app/modules/presentations/presentations_module.dart;
- criação das presentations;
- configuração do DataPicker em português;
- configuração do Validatorless para validação de formulários;
- criação do arquivo assets/json/cidades.json;
- configuração do pubspec.yaml para leitura do asset/json;
- criação do modelo /app/modules/read_from_json/models/cidades_model.dart;
- configuração do nome do App;
- configuração do ícone do App;
- configuração da Splash Screen;
- packages para usar o sqlite;
- 