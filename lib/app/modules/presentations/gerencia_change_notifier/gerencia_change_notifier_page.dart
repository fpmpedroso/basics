import 'package:basics/app/core/ui/helpers/size_extensions.dart';
import 'package:basics/app/core/ui/styles/colors_app.dart';
import 'package:basics/app/core/ui/styles/texts_app.dart';
import 'package:basics/app/modules/presentations/gerencia_change_notifier/gerencia_change_notifier_controller.dart';
import 'package:flutter/material.dart';

class GerenciaChangeNotifierPage extends StatefulWidget {
  const GerenciaChangeNotifierPage({Key? key}) : super(key: key);

  @override
  State<GerenciaChangeNotifierPage> createState() =>
      _GerenciaChangeNotifierPageState();
}

class _GerenciaChangeNotifierPageState
    extends State<GerenciaChangeNotifierPage> {
  //recebe-se a controller
  final controller = GerenciaChangeNotifierController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChangeNotifier'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 6, right: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '# Trabalhando com ChangeNotifier',
                style: context.textsApp.textBold
                    .copyWith(fontSize: 16, color: context.colors.darkBlue),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                '''1) Usa o sistema de observáveis e ouvintes
                  > quando um observável é mudado, ele próprio irá notificar todos os ouvintes''',
                style: context.textsApp.textRegular
                    .copyWith(fontSize: 14, color: context.colors.darkGrey),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '''2) Não pode ser confundido com o Provider: 
                  > o Provider é feito em cima do ChangeNotifier que por sua vez é nativo do Flutter''',
                style: context.textsApp.textRegular
                    .copyWith(fontSize: 14, color: context.colors.darkGrey),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '''3) Cria-se uma classe controladora que estende ChangeNotifier: 
                  > onde ficaram todos os observáveis''',
                style: context.textsApp.textRegular
                    .copyWith(fontSize: 14, color: context.colors.darkGrey),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '5) O campo que sofrerá alteração irá buscar seu valor na controller',
                style: context.textsApp.textRegular
                    .copyWith(fontSize: 14, color: context.colors.darkGrey),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '4) Recebe-se a controller em uma variável final da page',
                style: context.textsApp.textRegular
                    .copyWith(fontSize: 14, color: context.colors.darkGrey),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '5) Click na imagem abaixo para trocá-la',
                style: context.textsApp.textRegular
                    .copyWith(fontSize: 14, color: context.colors.darkGrey),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '''6) Sempre, depois de uma alteração na controller, notifica-se os ouvintes "notifyListeners"
                  para que o valor alterado possa sofre "rebuild"''',
                style: context.textsApp.textRegular
                    .copyWith(fontSize: 14, color: context.colors.darkGrey),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '7) aciona-se o método da controller para executar a ação',
                style: context.textsApp.textRegular
                    .copyWith(fontSize: 14, color: context.colors.darkGrey),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    controller.changeImage();   //aciona o método de alteração da controller
                  },
                  child: Container(
                    width: context.percentWidth(0.8),
                    height: context.percentWidth(0.5),
                    color: context.colors.lightBlue,
                    child: Image.asset(
                      controller.urlImage, //vai buscar o valor na controller
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
