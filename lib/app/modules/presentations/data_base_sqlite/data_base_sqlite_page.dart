import 'package:basics/app/core/ui/styles/colors_app.dart';
import 'package:basics/app/core/ui/styles/texts_app.dart';
import 'package:basics/app/modules/presentations/data_base_sqlite/data_base_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DataBaseSqlitePage extends StatelessWidget {
  const DataBaseSqlitePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //var teste = context.read<DataBaseController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Banco de Dados Interno'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 6, right: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '# Criação de Database no dispositivo',
              style: context.textsApp.textBold
                  .copyWith(fontSize: 16, color: context.colors.darkBlue),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              '1) Cria-se o arquivo de conexão dentro de app/core',
              style: context.textsApp.textRegular
                  .copyWith(fontSize: 14, color: context.colors.darkGrey),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
