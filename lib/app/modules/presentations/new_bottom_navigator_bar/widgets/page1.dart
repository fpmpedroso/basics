import 'package:basics/app/core/ui/styles/colors_app.dart';
import 'package:basics/app/core/ui/styles/texts_app.dart';
import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colors.whiteApp,
      child: Padding(
        padding: const EdgeInsets.only(top: 50, left: 6, right: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '# Construindo um BottomNavigatorBar',
              style: context.textsApp.textBold
                  .copyWith(fontSize: 16, color: context.colors.darkBlue),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              '> nunca pode ter menos do que 2 itens',
              style: context.textsApp.textRegular
                  .copyWith(fontSize: 14, color: context.colors.darkGrey),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '''2) É possível navegar entre páginas através do IndexedStack
              esse widget empilha widgets e os apresenta um por vez através do index''',
              style: context.textsApp.textRegular
                  .copyWith(fontSize: 14, color: context.colors.darkGrey),
            ),
          ],
        ),
      ),
    );
  }
}
