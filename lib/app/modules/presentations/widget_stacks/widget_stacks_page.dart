import 'package:basics/app/core/ui/styles/colors_app.dart';
import 'package:basics/app/core/ui/styles/texts_app.dart';
import 'package:flutter/material.dart';

class WidgetStacksPage extends StatelessWidget {
  const WidgetStacksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stacks'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 6, right: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '# Trabalhando com Stacks',
              style: context.textsApp.textBold
                  .copyWith(fontSize: 16, color: context.colors.darkBlue),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              '> Possibilita que os widgets sejam sobrepostos na tela. O primeiro a ser declarado fica por baixo.',
              style: context.textsApp.textRegular
                  .copyWith(fontSize: 14, color: context.colors.darkGrey),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    color: context.colors.darkOrange,
                  ),
                  Container(
                    color: context.colors.darkBlue,
                    width: 300,
                    height: 300,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      color: context.colors.lightGrey,
                      width: 150,
                      height: 150,
                    ),
                  ),
                  Positioned(
                    top: 40,
                    right: 200,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('/elaboratedStack');
                      },
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: context.colors.lightBlue,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Click',
                            style: TextStyle(
                                color: context.colors.whiteApp,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
