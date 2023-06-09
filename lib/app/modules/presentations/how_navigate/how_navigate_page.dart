import 'package:basics/app/core/logger/app_logger.dart';
import 'package:basics/app/core/ui/styles/colors_app.dart';
import 'package:basics/app/core/ui/styles/texts_app.dart';
import 'package:basics/app/core/ui/widgets/button_widget.dart';
import 'package:basics/app/modules/presentations/how_navigate/how_navigate_controller.dart';
import 'package:basics/app/modules/presentations/how_navigate/how_navigate_module.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HowNavigatePage extends StatelessWidget {
  //recebe-se a controller
  // ignore: unused_field
  final HowNavigateController _controller;

  const HowNavigatePage({Key? key, required HowNavigateController controller})
      : _controller = controller,
        super(key: key);

  //navegação personalizada com efeitos
  //recebe um contexto pelo fato de que essa página é um StatelessWidget e não constroi sozinho
  void _gotoHowNavigateTransition(BuildContext context) {
    Navigator.of(context).push(PageRouteBuilder(
      //duração da transição
      transitionDuration: const Duration(milliseconds: 400),

      //forma de fazer a transição de tela
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        animation = CurvedAnimation(
            parent: animation,

            //tipo de curva da animação (possível pesquisar Flutter curves)
            curve: Curves.easeInQuad);

        //retorno da disposição na tela (escalas)
        return ScaleTransition(
          scale: animation,
          
          //de onde aparece a tela
          alignment: Alignment.bottomRight,
          
          //adiciona quem? o child recebido
          child: child,
        );
      },

      pageBuilder: (context, animation, secondaryAnimation) {
        //esse método (.getPage() foi herdado pela classe HowNavigateModule)
        return HowNavigateModule().getPage('/transition', context);
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    AppLogger log = context.read<AppLogger>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Navegação'),
      ),
      body: SingleChildScrollView(
        child: Padding(
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

                      log.info(message);
                    },
                    label: 'Espere a msg e faça um print'),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '> Criação de uma nova página e com efeito de transição',
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
                    onPressed: () {
                      _gotoHowNavigateTransition(context);
                    },
                    label: 'Efeito de transição'),
              ),
              const SizedBox(
              height: 20,
            ),
            ],
          ),
        ),
      ),
    );
  }
}
