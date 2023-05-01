import 'package:basics/app/core/logger/app_logger.dart';
import 'package:basics/app/core/ui/styles/colors_app.dart';
import 'package:basics/app/core/ui/styles/texts_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtonsTypePage extends StatelessWidget {
  const ButtonsTypePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    AppLogger log = context.read<AppLogger>();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tipos de botões'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 6, right: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '# Tipos de Botões?',
              style: context.textsApp.textBold
                  .copyWith(fontSize: 16, color: context.colors.darkBlue),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child:
                  TextButton(onPressed: () {}, child: const Text('TextButton')),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.radio_button_checked),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.colors.lightOrange,
                  shadowColor: context.colors.lightGrey,
                  minimumSize: const Size(120, 35),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text('ElevatedButton'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return context.colors.darkGrey;
                    } else {
                      return context.colors.lightBlue;
                    }
                  }),
                ),
                child: const Text('Trocando a cor'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.airplane_ticket),
                  label: const Text('ElevatedButton.icon')),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: InkWell(
                onTap: (){},
                child: const Text('InkWell'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: GestureDetector(
                onTap: () => log.info('Tap gesture'),
                onVerticalDragStart: (coordenada) => log.info('gesture movimentado $coordenada'),
                child: const Text('GestureDetecture'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
