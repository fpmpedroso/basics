// declara-se a variável que será escutada como ValueNotifier<tipo>;

// para alterá-la, utiliza-se seu nome.value;

// para "escutá-la" utiliza-se ValueListnableBuilder. No exemplo não foi utilizado context e nem child;

import 'package:basics/app/core/logger/app_logger.dart';
import 'package:basics/app/core/ui/helpers/size_extensions.dart';
import 'package:basics/app/core/ui/styles/colors_app.dart';
import 'package:basics/app/core/ui/styles/texts_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GerenciaValueNotifierPage extends StatefulWidget {
  const GerenciaValueNotifierPage({Key? key}) : super(key: key);

  @override
  State<GerenciaValueNotifierPage> createState() =>
      _GerenciaValueNotifierPageState();
}

class _GerenciaValueNotifierPageState extends State<GerenciaValueNotifierPage> {
  //declara-se que é uma variável da Classe ValueNotifier
  var urlImage = ValueNotifier<String>('assets/images/img_demo.jpeg');

  void _changeImage() {
    if (urlImage.value == 'assets/images/img_demo.jpeg') {
      urlImage.value = 'assets/images/img_logo.png';
    } else if (urlImage.value == 'assets/images/img_logo.png') {
      urlImage.value = 'assets/images/img_demo.jpeg';
    }
  }

  @override
  Widget build(BuildContext context) {
    AppLogger log = context.read<AppLogger>();

    log.info('### Build da tela');

    return Scaffold(
      appBar: AppBar(
        title: const Text('ValueNotifier'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 6, right: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '# Usando o ValueNotifier',
              style: context.textsApp.textBold
                  .copyWith(fontSize: 16, color: context.colors.darkBlue),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              '''> Uma classe que funciona por REAÇÃO
                > sempre que um item é atualizado, o Flutter faz um Rebuild específico 
                > existe uma atualização somente de parte da tela, diferente do SetState que 
                > muda tudo.''',
              style: context.textsApp.textRegular
                  .copyWith(fontSize: 14, color: context.colors.darkGrey),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '1) o valor que será alterável deve fazer parte de uma classe ValueNotifier',
              style: context.textsApp.textRegular
                  .copyWith(fontSize: 14, color: context.colors.darkGrey),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '''2) o espaço da tela que será alterado deverá ficar "escutando" a possível alteração 
                  através da classe ValueListnableBuilder, tipando o valor que está sendo escutado''',
              style: context.textsApp.textRegular
                  .copyWith(fontSize: 14, color: context.colors.darkGrey),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '3) Click na imagem abaixo para trocá-la',
              style: context.textsApp.textRegular
                  .copyWith(fontSize: 14, color: context.colors.darkGrey),
            ),
            const SizedBox(
              height: 20,
            ),
            ValueListenableBuilder<String>(
              //classe de reação da alteração, deve ser tipada
              valueListenable: urlImage, //valor que está sendo monitorado
              builder: (_, urlImageValue, __) {
                //context e child não foram usados
                
                log.info('### Build somente do Widget');
                return Center(
                  child: GestureDetector(
                    onTap: () {
                      _changeImage();
                    },
                    child: Container(
                      width: context.percentWidth(0.8),
                      height: context.percentWidth(0.5),
                      color: context.colors.lightBlue,
                      child: Image.asset(
                        urlImageValue, //nome da variável que está sendo alterada
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
