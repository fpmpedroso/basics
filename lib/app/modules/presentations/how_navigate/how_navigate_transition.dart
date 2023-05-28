import 'package:basics/app/core/ui/styles/colors_app.dart';
import 'package:basics/app/core/ui/styles/texts_app.dart';
import 'package:flutter/material.dart';

class HowNavigateTransition extends StatelessWidget {
  const HowNavigateTransition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        
        //botão de back para false
        automaticallyImplyLeading: false,
        
        elevation: 0,
        title: const Text('Navigate com efeitos'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.close,
                color: context.colors.darkBlue,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 6, right: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '# Navegação com efeitos',
              style: context.textsApp.textBold
                  .copyWith(fontSize: 16, color: context.colors.darkBlue),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              '> Para esse tipo de navegação, foi criada uma estrutura no arquivo /app/core/modules/projeto_module.dart',
              style: context.textsApp.textRegular.copyWith(
                fontSize: 14,
                color: context.colors.darkGrey,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '> utiliza-se o método então criado na classe ProjetoModule e herdado pela HowNavigateModule (getPage) para ir buscar a rota e seus respectivos bindings',
              style: context.textsApp.textRegular.copyWith(
                fontSize: 14,
                color: context.colors.darkGrey,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '''> dentre os parâmetros usados para transição é possível pesquisar vários tipos:
                - exemplo de pesquisa: "flutter curves", encontra-se vários tipos;
                - alignments: possível mudar de onde a tela aparece''',
              style: context.textsApp.textRegular.copyWith(
                fontSize: 14,
                color: context.colors.darkGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
