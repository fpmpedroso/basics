import 'package:basics/app/core/ui/styles/colors_app.dart';
import 'package:basics/app/core/ui/styles/texts_app.dart';
import 'package:flutter/material.dart';
import 'package:basics/app/core/ui/widgets/button_widget.dart';

class HowNavigateParam extends StatelessWidget {
  const HowNavigateParam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Recebendo parâmetro'),
        ),
        body: Padding(
            padding: const EdgeInsets.only(top: 50, left: 6, right: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '# Como receber parâmetros?',
                  style: context.textsApp.textBold
                      .copyWith(fontSize: 16, color: context.colors.darkBlue),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  r"> final args = ModalRoute.of(context)?.settings.arguments;",
                  style: context.textsApp.textRegular.copyWith(
                      fontSize: 14,
                      color: context.colors.whiteApp,
                      backgroundColor: Colors.black),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  '> o valor recebido foi: $args',
                  style: context.textsApp.textRegular
                      .copyWith(fontSize: 16, color: context.colors.darkBlue),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: ButtonWidget.primary(
                      onPressed: () {
                        Navigator.of(context)
                            .pop('####### Msg do pop ##########');
                      },
                      label: 'Voltar com msg'),
                ),
              ],
            )));
  }
}
