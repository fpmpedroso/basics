import 'package:basics/app/core/ui/helpers/size_extensions.dart';
import 'package:basics/app/models/data_sqlite_model.dart';
import 'package:flutter/material.dart';

class ListViewDados extends StatefulWidget {
  //recebe-se uma instância do modelo de dados
  final DataSqliteModel _dataSqliteModel;

  const ListViewDados({Key? key, required DataSqliteModel dataSqliteModel})
    : _dataSqliteModel = dataSqliteModel,
      super(key: key);

  @override
  State<ListViewDados> createState() => _ListViewDadosState();
}

class _ListViewDadosState extends State<ListViewDados> {
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.percentWidth(0.8),
      height: context.percentWidth(0.6),
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 10),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Text(
            widget._dataSqliteModel.descricao
          );
        },
      ),
    );
  }
}
