import 'package:basics/app/core/ui/styles/colors_app.dart';
import 'package:basics/app/core/ui/styles/texts_app.dart';
import 'package:flutter/material.dart';

class PageViewWidget2 extends StatelessWidget {
  const PageViewWidget2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colors.lightBlue,
      child: Padding(
        padding: const EdgeInsets.only(top: 50, left: 6, right: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '> mantém a mesma página de fundo e troca somente a frente',
              style: context.textsApp.textRegular
                  .copyWith(fontSize: 14, color: context.colors.whiteApp),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '> apresenta somente um por vez. Veja que atrás dessa tela não tem nada',
              style: context.textsApp.textRegular
                  .copyWith(fontSize: 14, color: context.colors.whiteApp),
            ),
          ],
        ),
      ),
    );
  }
}
