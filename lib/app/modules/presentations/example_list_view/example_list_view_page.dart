import 'package:basics/app/core/ui/helpers/size_extensions.dart';
import 'package:basics/app/core/ui/styles/colors_app.dart';
import 'package:basics/app/core/ui/styles/texts_app.dart';
import 'package:flutter/material.dart';

class ExampleListViewPage extends StatelessWidget {
  const ExampleListViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List View'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 6, right: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '# Criando listas no Flutter',
              style: context.textsApp.textBold
                  .copyWith(fontSize: 16, color: context.colors.darkBlue),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              '1) ListView.builder',
              style: context.textsApp.textRegular
                  .copyWith(fontSize: 14, color: context.colors.darkGrey),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: context.percentWidth(0.5),
              height: context.percentWidth(0.3),
              child: ListView.builder(
                padding: const EdgeInsets.only(left: 10),
                //qtd de itens
                itemCount: 5,
                //recebe-se um contexto e um índice
                itemBuilder: (context, index) {
                  return Text('O item é $index');
                },
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              '2) ListView.builder com ListTile',
              style: context.textsApp.textRegular
                  .copyWith(fontSize: 14, color: context.colors.darkGrey),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: context.percentWidth(0.5),
              height: context.percentWidth(0.3),
              child: ListView.builder(
                padding: const EdgeInsets.only(left: 10),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Índice $index'),
                    subtitle: const Text('subtítulo'),
                    leading: const CircleAvatar(),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
