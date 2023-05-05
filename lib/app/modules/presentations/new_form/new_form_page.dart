import 'package:basics/app/core/ui/styles/colors_app.dart';
import 'package:basics/app/core/ui/styles/texts_app.dart';
import 'package:flutter/material.dart';

class NewFormPage extends StatefulWidget {
  const NewFormPage({Key? key}) : super(key: key);

  @override
  State<NewFormPage> createState() => _NewFormPageState();
}

class _NewFormPageState extends State<NewFormPage> {
  //texto do ex 1)
  String txtExample1 = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulários'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 6, right: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '# Trabalhando com formulários',
              style: context.textsApp.textBold
                  .copyWith(fontSize: 16, color: context.colors.darkBlue),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              '1) TextField: a maneira mais fácil e sem muitos recursos (não pode ser validado)',
              style: context.textsApp.textRegular
                  .copyWith(fontSize: 14, color: context.colors.darkGrey),
            ),
            Form(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    TextField(
                      onChanged: (String value) {
                        setState(() {
                          txtExample1 = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('Texto digitado: $txtExample1'),
                  ],
                ),
              )
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '2) TextFormField: o mais usado (completo)',
              style: context.textsApp.textRegular
                  .copyWith(fontSize: 14, color: context.colors.darkGrey),
            ),
          ],
        ),
      ),
    );
  }
}
