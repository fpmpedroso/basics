import 'package:basics/app/core/ui/styles/buttons_app.dart';
import 'package:basics/app/core/ui/styles/colors_app.dart';
import 'package:basics/app/core/ui/styles/texts_app.dart';
import 'package:basics/app/core/ui/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //var log = context.read<AppLogger>();
    //log.error('teste erro', 'nomeErro', StackTrace.current);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Column(
            children: [
              ButtonWidget.primary(
                onPressed: () {
                  Navigator.of(context).pushNamed('/newProject');
                },
                label: 'Criar projeto'
              ),
            ],
          ),
        ),
      ),
    );
  }
}
