import 'package:basics/app/core/logger/app_logger.dart';
import 'package:basics/app/core/ui/styles/colors_app.dart';
import 'package:basics/app/core/ui/styles/texts_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/dialog_custom.dart';

class DialogsPage extends StatelessWidget {
  const DialogsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLogger log = context.read<AppLogger>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dialogs'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 6, right: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '# Criando Dialogs',
              style: context.textsApp.textBold
                  .copyWith(fontSize: 16, color: context.colors.darkBlue),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              '1) Customizado (foi passado o context para o widget',
              style: context.textsApp.textRegular
                  .copyWith(fontSize: 14, color: context.colors.darkGrey),
            ),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                      barrierDismissible:
                          false, //true para autorizar fechar quando clica fora
                      context: context,
                      builder: (_) {
                        //ou (context){
                        return DialogCustom(context: context);
                      });
                },
                child: const Text('Open Custom Dialog')),
            const SizedBox(
              height: 20,
            ),
            Text(
              '2) Simple Dialog',
              style: context.textsApp.textRegular
                  .copyWith(fontSize: 14, color: context.colors.darkGrey),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return SimpleDialog(
                        contentPadding: const EdgeInsets.all(50),
                        title: Text(
                          'Título',
                          style: context.textsApp.textBold.copyWith(
                              fontSize: 14, color: context.colors.darkGrey),
                        ),
                        children: [
                          Text(
                            'nonononono',
                            style: context.textsApp.textRegular.copyWith(
                                fontSize: 12, color: context.colors.darkGrey),
                          ),
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('Fechar'),
                          ),
                        ],
                      );
                    });
              },
              child: const Text('Open Simple Dialog'),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '3) Alert Dialog',
              style: context.textsApp.textRegular
                  .copyWith(fontSize: 14, color: context.colors.darkGrey),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Título'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: const [
                              Padding(
                                padding: EdgeInsets.all(8),
                                child: Text('nononon'),
                              ),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {}, child: const Text('Cancelar')),
                          TextButton(
                              onPressed: () {}, child: const Text('Confirmar')),
                        ],
                      );
                    });
              },
              child: const Text('Open Alert Dialog'),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '4) TimePicker',
              style: context.textsApp.textRegular
                  .copyWith(fontSize: 14, color: context.colors.darkGrey),
            ),
            ElevatedButton(
                onPressed: () async {
                  //await para esperar retornar o valor
                  final selectedTime = await showTimePicker(
                      context: context, initialTime: TimeOfDay.now());

                  log.append(selectedTime.toString());
                  log.append(selectedTime?.hour.toString());
                  log.append(selectedTime?.minute.toString());
                  log.closeAppend();
                  log.info(selectedTime);
                },
                child: const Text('Open TimePicker')),
            const SizedBox(
              height: 20,
            ),
            Text(
              '5) DatePicker',
              style: context.textsApp.textRegular
                  .copyWith(fontSize: 14, color: context.colors.darkGrey),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Open DatePicker'),
            ),
          ],
        ),
      ),
    );
  }
}
