import 'package:basics/app/core/ui/styles/colors_app.dart';
import 'package:basics/app/core/ui/styles/texts_app.dart';
import 'package:basics/app/core/ui/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class HowNavigatePage extends StatelessWidget {
  const HowNavigatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navegação'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 6, right: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '# Como fazer navegação em Flutter?',
              style: context.textsApp.textBold
                  .copyWith(fontSize: 16, color: context.colors.darkBlue),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              '> o Flutter usa o conceito de "pilhas", caso não feche a página, as demais serão empilhadas',
              style: context.textsApp.textRegular
                  .copyWith(fontSize: 14, color: context.colors.darkGrey),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '> Existem dois tipos: por página e por nome',
              style: context.textsApp.textRegular
                  .copyWith(fontSize: 14, color: context.colors.darkGrey),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '> 1) Por página: ',
              style: context.textsApp.textRegular
                  .copyWith(fontSize: 14, color: context.colors.darkGrey),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '> Navigator.of(context).push(MaterialPageRoute(builder: (_) => PaginaDesejada()));',
              style: context.textsApp.textRegular.copyWith(
                  fontSize: 14,
                  color: context.colors.whiteApp,
                  backgroundColor: Colors.black),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '> 2) Por nome:',
              style: context.textsApp.textRegular
                  .copyWith(fontSize: 14, color: context.colors.darkGrey),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              r"> Navigator.of(context).pushNamed('/nomePagina');",
              style: context.textsApp.textRegular.copyWith(
                  fontSize: 14,
                  color: context.colors.whiteApp,
                  backgroundColor: Colors.black),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '> Passagem de parâmetro:',
              style: context.textsApp.textRegular
                  .copyWith(fontSize: 14, color: context.colors.darkGrey),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              r"> Navigator.of(context).pushNamed('/nomePagina', arguments: 'valor_no_formato_necessário');",
              style: context.textsApp.textRegular.copyWith(
                  fontSize: 14,
                  color: context.colors.whiteApp,
                  backgroundColor: Colors.black),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: ButtonWidget.primary(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed('/param', arguments: 'parâmetro');
                  },
                  label: 'Teste o parâmetro'),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '> é possível deixar o flutter aguardando (await) o retorno da tela que abriu',
              style: context.textsApp.textRegular.copyWith(
                fontSize: 14,
                color: context.colors.darkGrey,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: ButtonWidget.primary(
                  onPressed: () async {
                    var message =
                        await Navigator.of(context).pushNamed('/param');

                    print(message);
                  },
                  label: 'Espere a msg e faça um print'),
            ),
          ],
        ),
      ),
    );
  }
}
