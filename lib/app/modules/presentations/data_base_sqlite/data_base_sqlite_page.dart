import 'package:basics/app/modules/presentations/data_base_sqlite/data_base_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DataBaseSqlitePage extends StatelessWidget {
  const DataBaseSqlitePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var teste = context.read<DataBaseController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Banco de Dados Interno'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: InkWell(
          onTap: () => teste.openConnection(),
          child: const Text('Teste'),
        ),
      ),
    );
  }
}
