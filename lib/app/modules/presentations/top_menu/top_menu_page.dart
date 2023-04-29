import 'package:basics/app/core/ui/styles/colors_app.dart';
import 'package:basics/app/core/ui/styles/texts_app.dart';
import 'package:flutter/material.dart';

class TopMenuPage extends StatelessWidget {

  const TopMenuPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer'),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pop(), 
            icon: const Icon(Icons.navigate_before)
          ),
          IconButton(
            onPressed: () => Navigator.of(context).pop(), 
            icon: const Icon(Icons.close_sharp)
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: context.colors.lightBlue,
        child: const Center(
          child: Text('Item do menu'),
        ),
      ),
      endDrawer: const Drawer(
        child: Center(
          child: Text('EndDrawer')
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 6, right: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '# Como criar um menu superior',
              style: context.textsApp.textBold
                  .copyWith(fontSize: 16, color: context.colors.darkBlue),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              '> "Drawer" para menu',
              style: context.textsApp.textRegular
                  .copyWith(fontSize: 14, color: context.colors.darkGrey),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '> "endDrawer" para menu de arrastar na esquerda',
              style: context.textsApp.textRegular
                  .copyWith(fontSize: 14, color: context.colors.darkGrey),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '> "actions" para botões',
              style: context.textsApp.textRegular
                  .copyWith(fontSize: 14, color: context.colors.darkGrey),
            ),
          ],
        ),
      ),
    );
  }
}