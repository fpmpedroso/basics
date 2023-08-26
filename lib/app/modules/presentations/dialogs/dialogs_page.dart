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
      body: SingleChildScrollView(
        child: Padding(
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
                          //ou (context){, uma vez que é o context do dialog e não do scaffold
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
                      builder: (_) {
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
                      builder: (_) {
                        return AlertDialog(
                          title: const Text('Título'),
                          content: const SingleChildScrollView(
                            child: ListBody(
                              children: [
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
      
                    if (selectedTime != null) {
                      log.append(selectedTime.toString());
                      log.append(selectedTime.hour.toString());
                      log.append(selectedTime.minute.toString());
                      log.closeAppend();
                      log.info(selectedTime);
                    }
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
                onPressed: () async {
                  final selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2030));
      
                  if (selectedDate != null) {
                    log.append(selectedDate.day.toString());
                    log.append(selectedDate.month.toString());
                    log.append(selectedDate.year.toString());
                    log.closeAppend();
                    log.info(selectedDate);
                  }
                },
                child: const Text('Open DatePicker'),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '6) para trocar a localização para Pt, deve-se:',
                style: context.textsApp.textRegular
                    .copyWith(fontSize: 14, color: context.colors.darkGrey),
              ),
              Text(
                ''' > inserir em pubspec.yml: 
                  flutter_localizations:
                    sdk: flutter''',
                style: context.textsApp.textRegular
                    .copyWith(fontSize: 14, color: context.colors.darkGrey),
              ),
              Text(
                ''' > onde se encontra o MaterialApp, insere-se: 
                  //INÍCIO: suporte para região e língua do app (em conjunto com a declaração no yaml)
                    localizationsDelegates: const[
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    supportedLocales: const[
                      Locale('pt', 'BR'),
                    ],
                  //FIM: suporte para região e língua do app''',
                style: context.textsApp.textRegular
                    .copyWith(fontSize: 14, color: context.colors.darkGrey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
