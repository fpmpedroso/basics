import 'package:basics/app/core/ui/helpers/size_extensions.dart';
import 'package:basics/app/core/ui/styles/colors_app.dart';
import 'package:basics/app/core/ui/styles/texts_app.dart';
import 'package:basics/app/modules/presentations/gerencia_provider/gerencia_provider_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GerenciaProviderPage extends StatelessWidget {
  const GerenciaProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 6, right: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '# Gerência de Estado com Provider',
                style: context.textsApp.textBold
                    .copyWith(fontSize: 16, color: context.colors.darkBlue),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                '> trabalha em cima do ChangeNotifier',
                style: context.textsApp.textRegular
                    .copyWith(fontSize: 14, color: context.colors.darkGrey),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '1) Cria-se uma classe controladora que estende ChangeNotifier',
                style: context.textsApp.textRegular
                    .copyWith(fontSize: 14, color: context.colors.darkGrey),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '2) Cria-se uma classe module que será responsável por indicar a rota e binding',
                style: context.textsApp.textRegular
                    .copyWith(fontSize: 14, color: context.colors.darkGrey),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '''3) Por ser um binding que interessa somente para esse módulo que se cria uma classe module
                  > dessa forma, não se pode carregar o modulo em PresentationsModule, mas sim em AppWidget''',
                style: context.textsApp.textRegular
                    .copyWith(fontSize: 14, color: context.colors.darkGrey),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '4) Chama-se a função da controller através do context.read()',
                style: context.textsApp.textRegular
                    .copyWith(fontSize: 14, color: context.colors.darkGrey),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '5) Exemplo utilizando Consumer() para alteração de um objeto todo',
                style: context.textsApp.textRegular
                    .copyWith(fontSize: 14, color: context.colors.darkGrey),
              ),
              const SizedBox(
                height: 20,
              ),
              Consumer<GerenciaProviderController>(
                builder: (_, controller, __) {
                  return Center(
                    child: GestureDetector(
                      onTap: () {
                        context.read<GerenciaProviderController>().changeImage();
                      },
                      child: Container(
                        width: context.percentWidth(0.8),
                        height: context.percentWidth(0.5),
                        color: context.colors.lightBlue,
                        child: Image.asset(
                          controller.urlImage, //nome da imagem que será alterado
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '6) Caso tenha interesse de atualizar somente parte do objeto que se escuta, utiliza-se Selector() em vez de Consumer()',
                style: context.textsApp.textRegular
                    .copyWith(fontSize: 14, color: context.colors.darkGrey),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '6.1) O Selector() é tipado com o tipo da controller e com o tipo da parte do objeto que se retorna',
                style: context.textsApp.textRegular
                    .copyWith(fontSize: 14, color: context.colors.darkGrey),
              ),
              const SizedBox(
                height: 20,
              ),
              Selector<GerenciaProviderController, String>(
                selector:(_, controller) => controller.urlImageSelector,
                builder: (_, urlValue, __){
                  return Center(
                    child: GestureDetector(
                      onTap: () {
                        context.read<GerenciaProviderController>().changeImageSelector();
                      },
                      child: Container(
                        width: context.percentWidth(0.8),
                        height: context.percentWidth(0.5),
                        color: context.colors.lightBlue,
                        child: Image.asset(
                          urlValue, //nome específico
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  );
                }, 
              )
            ],
          ),
        ),
      ),
    );
  }
}
