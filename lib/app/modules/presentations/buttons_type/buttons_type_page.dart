import 'package:basics/app/core/ui/styles/colors_app.dart';
import 'package:basics/app/core/ui/styles/texts_app.dart';
import 'package:flutter/material.dart';

class ButtonsTypePage extends StatelessWidget {

  const ButtonsTypePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tipos de botões'),),
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
              child: TextButton(
                onPressed: (){}, 
                child: const Text('TextButton')
              ),
            ),
            Center(
              child: IconButton(
                onPressed: (){},
                icon: const Icon(Icons.radio_button_checked),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: (){},
                child: const Text('ElevatedButton'),
              ),
            ),
            Center(
              child: ElevatedButton.icon(
                onPressed: (){}, 
                icon: const Icon(Icons.airplane_ticket), 
                label: const Text('ElevatedButton.icon')
              ),
            )
          ],
        ),
      ),
    );
  }
}