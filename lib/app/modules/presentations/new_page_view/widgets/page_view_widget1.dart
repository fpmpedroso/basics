import 'package:basics/app/core/ui/styles/colors_app.dart';
import 'package:basics/app/core/ui/styles/texts_app.dart';
import 'package:flutter/material.dart';

class PageViewWidget1 extends StatelessWidget {
  const PageViewWidget1({Key? key}) : super(key: key);

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
              '# Trocar de páginas com PageView',
              style: context.textsApp.textBold
                  .copyWith(fontSize: 16, color: context.colors.darkBlue),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              '> empilha páginas, como o BottomNavigatorBar, mas navega através de swipe (vertical, horizontal)',
              style: context.textsApp.textRegular
                  .copyWith(fontSize: 14, color: context.colors.darkGrey),
            ),
            const SizedBox(
              height: 400,
            ),
            Expanded(
              child: Container(
                color: context.colors.lightBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
