import 'package:basics/app/core/notifier/default_listener_notifier.dart';
import 'package:basics/app/core/ui/helpers/messages.dart';
import 'package:basics/app/core/ui/helpers/messages_no_mixin.dart';
import 'package:basics/app/core/ui/helpers/size_extensions.dart';
import 'package:basics/app/core/ui/styles/colors_app.dart';
import 'package:basics/app/core/ui/styles/texts_app.dart';
import 'package:basics/app/models/data_sqlite_model.dart';
import 'package:basics/app/modules/presentations/data_sqlite/data_sqlite_controller.dart';
import 'package:basics/app/modules/presentations/data_sqlite/widget/calendar_widget.dart';
import 'package:basics/app/modules/presentations/data_sqlite/widget/list_view_dados.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DataSqlitePage extends StatefulWidget {
  //armazena-se uma instância da controller
  final DataSqliteController _controller;

  const DataSqlitePage({Key? key, required DataSqliteController controller})
      : _controller = controller,
        super(key: key);

  @override
  State<DataSqlitePage> createState() => _DataSqlitePageState();
}

class _DataSqlitePageState extends State<DataSqlitePage>
    with Messages<DataSqlitePage> {
  //chave do formulário
  final _formKey = GlobalKey<FormState>();

  //armazenamento de dados do formulário
  final _formDescriptionEC = TextEditingController();

  @override
  void initState() {
    super.initState();

    /*INÍCIO: listener para o loader => FOI TROCADO PELA LÓGICA DE SISTEMATIZAR LOAD E MSG
    //adicionando um listener na página para alterações de variável na controller
    context.read<DataSqliteController>().addListener(() {
      var loader = context.read<DataSqliteController>().loaderIsOpen;

      if (loader) {
        showLoader();
      } else {
        hideLoader();
      }
    });
    //FIM: listener para o loader */

    //INÍCIO: utilização do controle de notificação de loader e msg

    //informa que o changeNotifier está dentro da controller através do provider
    var defaultListener = DefaultListenerNotifier(
      changeNotifier: context.read<DataSqliteController>(),
      messagesNoMixin: context.read<MessagesNoMixin>(),
    );

    //invoca-se o método listener e passa o context do BuildContext como parâmetro
    //a função anônima successVoidCallBack deve ser passada no caso de sucesso
    defaultListener.listener(
        context: context,
        everyCallBack: (notifier, listenerInstance) {
          //verifica se existe transmissão de alguma mensagem da controle e exibe

          //no caso foi feita uma auto-promoção do notifier que era de DefaultListenerNotifier para DataSqliteController
          //isso para poder obter o atributo hasInfo da Controller
          if (notifier is DataSqliteController) {
            if (notifier.hasInfo) {
              //pode usar com mixin mesmo
              //pode forçar pq foi verificado dentro da controlelr
              showSuccess(notifier.msgSucesso!);
            }
          }
        },
        successCallBack: (notifier, listenerInstance) {
          //deve-se descarregar o listener (chama listenerIsntance por conter uma instância de changeNotifier, local que está o método dispose)
          listenerInstance.dispose();

          //pode-se fazer uma navegação por exemplo
          //Navigator.of(context).pop();
        },
        errorCallBack: (notifier, listenerInstance) {
          //implementação não obrigatória para msg de erro
        });

    //FIM: utilização do controle de notificação de loader e msg

    //espera-se a tela ser carregada e chama o método para buscar os dados
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<DataSqliteController>().findAll();
    });
  }

  @override
  void dispose() {
    super.dispose();

    _formDescriptionEC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Database'),
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
                      CalendarWidget(),
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
                          }
                        },
                        child: const Text('Salvar'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Divider(
                        color: context.colors.darkGrey,
                        thickness: 2,
                      ),
                      /*ListViewDados(
                        dataSqliteModel: DataSqliteModel(
                          id: 01,
                          dateTime: DateTime.now(),
                          descricao: 'descrição',
                        ),
                      ),*/
                      SizedBox(
                        width: context.percentWidth(0.8),
                        height: context.percentWidth(0.6),
                        child: Consumer<DataSqliteController>(
                          builder: (_, controller, __) {
                            return ListView.builder(
                              padding: const EdgeInsets.only(left: 10),
                              itemCount: controller.listaDados.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(
                                      controller.listaDados[index].descricao),
                                  subtitle: Text(controller.listaDados[index].dateTime.toString()),
                                );
                              },
                            );
                          },
                        ),
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
