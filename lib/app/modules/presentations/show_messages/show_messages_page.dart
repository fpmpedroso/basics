import 'package:basics/app/core/ui/helpers/messages.dart';
import 'package:basics/app/core/ui/styles/colors_app.dart';
import 'package:basics/app/core/ui/styles/texts_app.dart';
import 'package:flutter/material.dart';

class ShowMessagesPage extends StatefulWidget {
  const ShowMessagesPage({Key? key}) : super(key: key);

  @override
  State<ShowMessagesPage> createState() => _ShowMessagesPageState();
}

class _ShowMessagesPageState extends State<ShowMessagesPage>
    with Messages<ShowMessagesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exibindo Msgs'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 6, right: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '# Exibindo Mensagens ao usuário',
              style: context.textsApp.textBold
                  .copyWith(fontSize: 16, color: context.colors.darkBlue),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              '1) Simple Snackar',
              style: context.textsApp.textRegular
                  .copyWith(fontSize: 14, color: context.colors.darkGrey),
            ),
            ElevatedButton(
              onPressed: () {
                final snackBar = SnackBar(
                  content: const Text('Msg ao usuário'),
                  backgroundColor: context.colors.lightBlue,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: const Text('Simple Snackbar'),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              '2) Snackbar Action',
              style: context.textsApp.textRegular
                  .copyWith(fontSize: 14, color: context.colors.darkGrey),
            ),
            ElevatedButton(
              onPressed: () {
                final snackBar = SnackBar(
                  content: const Text('Msg ao usuário'),
                  backgroundColor: context.colors.lightBlue,
                  action: SnackBarAction(
                    onPressed: () {
                      ScaffoldMessenger.of(context).removeCurrentSnackBar();
                    },
                    label: 'Desfazer',
                    textColor: context.colors.darkBlue,
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: const Text('Snackbar Action'),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              '''3) Personalizado com package
              > Como o pacote top_snackbar_flutter foi feito no formato de mixin, é necessário
              declará-lo em uma StateFulWidget "... with Messages<ShowMessagesPage>,
              após isso, basta chamar o método desejado"''',
              style: context.textsApp.textRegular
                  .copyWith(fontSize: 14, color: context.colors.darkGrey),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      showInfo('Msg...');
                    },
                    child: const Text('Info')),
                ElevatedButton(
                    onPressed: () {
                      showError('Msg...');
                    },
                    child: const Text('Error')),
                ElevatedButton(
                    onPressed: () {
                      showSuccess('Msg...');
                    },
                    child: const Text('Success')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
