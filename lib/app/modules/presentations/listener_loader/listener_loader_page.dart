// no initState foi adicionado um listener que ouve a variável para abrir e fechar o loader
// o loader é um mixin

import 'package:basics/app/core/ui/helpers/loader.dart';
import 'package:basics/app/core/ui/styles/colors_app.dart';
import 'package:basics/app/core/ui/styles/texts_app.dart';
import 'package:basics/app/modules/presentations/listener_loader/listener_loader_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListenerLoaderPage extends StatefulWidget {
  //recebe-se a controller
  final ListenerLoaderController _controller;

  const ListenerLoaderPage(
      {Key? key, required ListenerLoaderController controller})
      : _controller = controller,
        super(key: key);

  @override
  State<ListenerLoaderPage> createState() => _ListenerLoaderPageState();
}

class _ListenerLoaderPageState extends State<ListenerLoaderPage> with Loader {
  @override
  void initState() {
    super.initState();

    //fica escutando alterações da controller
    context.read<ListenerLoaderController>().addListener(() {
      final loaderIsOpen = context.read<ListenerLoaderController>().loaderIsOpen;

      //faz a lógica de mostrar e esconder o loader
      if (loaderIsOpen) {
        showLoader();
      } else {
        hideLoader();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listener & Loader'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 6, right: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '# Adicionar um Listener no InitState',
              style: context.textsApp.textBold
                  .copyWith(fontSize: 16, color: context.colors.darkBlue),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              '''> Não é possível instanciar Mixins, então Mensagens e Loader que utilizam
                esse esquema não podem ser postos na Controller. Uma maneira para fazer o uso
                acaba sendo inserir um Listener na InitState da Page''',
              style: context.textsApp.textRegular
                  .copyWith(fontSize: 14, color: context.colors.darkGrey),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                widget._controller.changeLoader();
              },
              child: const Text('teste loader'),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '''Para que essa metodologia fique automática, é necessário envolver uma estrutura:
                > muito bem explicado na aula:
                > Hands-on Provier e Sqlite em arquitetura de módulo
                > aula Modulo Auth > Criando utilitários de controle de loader, success, error > ''',
              style: context.textsApp.textRegular
                  .copyWith(fontSize: 14, color: context.colors.darkGrey),
            ),
          ],
        ),
      ),
    );
  }
}
