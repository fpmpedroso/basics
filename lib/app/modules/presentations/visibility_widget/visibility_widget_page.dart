import 'package:basics/app/core/ui/styles/colors_app.dart';
import 'package:basics/app/core/ui/styles/texts_app.dart';
import 'package:flutter/material.dart';

class VisibilityWidgetPage extends StatefulWidget {
  const VisibilityWidgetPage({Key? key}) : super(key: key);

  @override
  State<VisibilityWidgetPage> createState() => _VisibilityWidgetPageState();
}

class _VisibilityWidgetPageState extends State<VisibilityWidgetPage> {
  bool _visibility = true;

  void changeVisibility() {
    
    setState(() {
      _visibility = !_visibility;  
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visibility Widget'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 6, right: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '# Mostrar/Esconder um widget',
              style: context.textsApp.textBold
                  .copyWith(fontSize: 16, color: context.colors.darkBlue),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              '> Utiliza-se a classe Visibility para alteração do visual',
              style: context.textsApp.textRegular
                  .copyWith(fontSize: 14, color: context.colors.darkGrey),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '> visible true para mostrar e false para desaparecer',
              style: context.textsApp.textRegular
                  .copyWith(fontSize: 14, color: context.colors.darkGrey),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '> ainda é possível utilizar o parâmetro replacement para mostrar algo',
              style: context.textsApp.textRegular
                  .copyWith(fontSize: 14, color: context.colors.darkGrey),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '1) Widget existente mas setado como invisível',
              style: context.textsApp.textRegular
                  .copyWith(fontSize: 14, color: context.colors.darkGrey),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () => changeVisibility(),
              child: Visibility(
                visible: _visibility,
                replacement: const Text('existe um container'),
                child: Center(
                  child: Container(
                    width: 30,
                    height: 30,
                    color: context.colors.darkBlue,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
