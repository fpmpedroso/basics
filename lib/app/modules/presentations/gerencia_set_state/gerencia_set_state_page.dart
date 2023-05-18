import 'package:basics/app/core/logger/app_logger.dart';
import 'package:basics/app/core/ui/helpers/size_extensions.dart';
import 'package:basics/app/core/ui/styles/colors_app.dart';
import 'package:basics/app/core/ui/styles/texts_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GerenciaSetStatePage extends StatefulWidget {
  const GerenciaSetStatePage({Key? key}) : super(key: key);

  @override
  State<GerenciaSetStatePage> createState() => _GerenciaSetStatePageState();
}

class _GerenciaSetStatePageState extends State<GerenciaSetStatePage> {
  String urlImage = 'assets/images/img_demo.jpeg';

  void _changeImage() {
    if (urlImage == 'assets/images/img_demo.jpeg') {
      setState(() {
        urlImage = 'assets/images/img_logo.png';
      });
    } else if (urlImage == 'assets/images/img_logo.png') {
      setState(() {
        urlImage = 'assets/images/img_demo.jpeg';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    AppLogger log = context.read<AppLogger>();

    log.info('### Build da tela');
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('SetState'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 6, right: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '# A maneira mais simples de gerenciar estados (SetState)',
              style: context.textsApp.textBold
                  .copyWith(fontSize: 16, color: context.colors.darkBlue),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              '''> Sempre em cima de um Statefull Widget
                > serve para pequenas alterações, pois seu maior problema é "build" da tela toda''',
              style: context.textsApp.textRegular
                  .copyWith(fontSize: 14, color: context.colors.darkGrey),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '1) Click na imagem abaixo para trocá-la',
              style: context.textsApp.textRegular
                  .copyWith(fontSize: 14, color: context.colors.darkGrey),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  _changeImage();
                },
                child: Container(
                  width: context.percentWidth(0.8),
                  height: context.percentWidth(0.5),
                  color: context.colors.lightBlue,
                  child: Image.asset(
                    urlImage, //nome da imagem que será alterado pelo SetState
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
