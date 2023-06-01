import 'package:basics/app/core/ui/helpers/messages.dart';
import 'package:basics/app/core/ui/styles/colors_app.dart';
import 'package:basics/app/core/ui/styles/texts_app.dart';
import 'package:basics/app/modules/presentations/data_base_sqlite/data_base_sqlite_controller.dart';
import 'package:flutter/material.dart';

import 'widgets/calendar_button.dart';

class DataBaseSqlitePage extends StatefulWidget {
  //armaze-na uma instância da controller
  final DataBaseSqliteController _controller;

  const DataBaseSqlitePage(
      {Key? key, required DataBaseSqliteController controller})
      : _controller = controller,
        super(key: key);

  @override
  State<DataBaseSqlitePage> createState() => _DataBaseSqlitePageState();
}

class _DataBaseSqlitePageState extends State<DataBaseSqlitePage>
    with Messages<DataBaseSqlitePage> {
  //chave do formulário
  final _formKey = GlobalKey<FormState>();

  //armazenamento de dados do formulário
  final _formDescriptionEC = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    _formDescriptionEC.dispose();
  }

  //6'59 implementando tela

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Banco de Dados Interno'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 6, right: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '# Criação de Database no dispositivo',
                style: context.textsApp.textBold
                    .copyWith(fontSize: 16, color: context.colors.darkBlue),
              ),
              const SizedBox(
                height: 50,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '''1) Utiliza-se os seguintes pacotes:
                  - sqflite para o Banco de Dados;
                  - path para setar o caminho correto de salvamento do Banco de Dados no dispositivo; 
                ''',
                style: context.textsApp.textRegular
                    .copyWith(fontSize: 14, color: context.colors.darkGrey),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '2) Cria-se o arquivo de conexão dentro de app/core/database/sqlite_connection_factory.dart',
                style: context.textsApp.textRegular
                    .copyWith(fontSize: 14, color: context.colors.darkGrey),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '3) Para resolver as questões de versões, utiliza-se sqlite_migration_factory.dart',
                style: context.textsApp.textRegular
                    .copyWith(fontSize: 14, color: context.colors.darkGrey),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '''4) Para controle de abertura e fechamento da conexão, utiliza-se sqlite_adm_connection.dart
                  - impede que interrupções corrompa o aplicativo;
                  - trata-se de um mixin com WidgetsBindingObserver que controla todos os estados do Flutter''',
                style: context.textsApp.textRegular
                    .copyWith(fontSize: 14, color: context.colors.darkGrey),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '''5) A classe de conexão deve ser provida para todo o projeto através do Provider
                  - é declarada na classe AppModule''',
                style: context.textsApp.textRegular
                    .copyWith(fontSize: 14, color: context.colors.darkGrey),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '''6) A classe de conexão deve ser provida para todo o projeto através do Provider
                  - é declarada na classe AppModule''',
                style: context.textsApp.textRegular
                    .copyWith(fontSize: 14, color: context.colors.darkGrey),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '''7) A Classe AppWidget é transformada em StatefulWidget para iniciar (initState) o controle da conexão com o BD
                  - após o uso, o observável sofre um "dispose"''',
                style: context.textsApp.textRegular
                    .copyWith(fontSize: 14, color: context.colors.darkGrey),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '''8) Como o Android gera arquivos backup na nuvem, é preciso desabilitar essa função para evitar problemas
                  - em android/app/src/main/AndroidManifest.xml, na tag Application 
                  - adiiona-se: android:allowBackup="false" e também android:fullBackupOnly="false" ''',
                style: context.textsApp.textRegular
                    .copyWith(fontSize: 14, color: context.colors.darkGrey),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '9) Para estruturar o uso do BD começa-se pelo Repository, Service e depois seu chamamento',
                style: context.textsApp.textRegular
                    .copyWith(fontSize: 14, color: context.colors.darkGrey),
              ),
              const SizedBox(
                height: 20,
              ),
              Divider(
                thickness: 2,
                color: context.colors.darkGrey,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '10) Exemplo para salvar dados no repositório:',
                style: context.textsApp.textRegular
                    .copyWith(fontSize: 14, color: context.colors.darkGrey),
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      CalendarButton(),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _formDescriptionEC,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'campo não preenchido';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          labelText: 'descrição',
                          labelStyle: context.textsApp.textRegular,
                          isDense: true,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          var formValid =
                              _formKey.currentState?.validate() ?? false;

                          if (formValid) {
                            //widget para chamar as variáveis iniciadas
                            widget._controller.save(_formDescriptionEC.text);

                            showSuccess('Sucesso!');
                          } else {
                            showError('Erro');
                          }
                        },
                        child: const Text('Salvar'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
