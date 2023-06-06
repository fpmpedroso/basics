import 'package:basics/app/core/ui/helpers/size_extensions.dart';
import 'package:basics/app/models/data_sqlite_model.dart';
import 'package:basics/app/modules/presentations/data_sqlite/data_sqlite_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListViewDados extends StatefulWidget {
  const ListViewDados({Key? key}) : super(key: key);

  @override
  State<ListViewDados> createState() => _ListViewDadosState();
}

class _ListViewDadosState extends State<ListViewDados> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.percentWidth(0.8),
      height: context.percentWidth(0.6),
      child: Selector<DataSqliteController, List<DataSqliteModel>>(
        selector: (_, controller) => controller.listaDados,
        builder: (_, value, __) {
          return ListView.builder(
            padding: const EdgeInsets.only(left: 10),
            itemCount: value.length,
            itemBuilder: (context, index) {
              return Text('item: ${value[index]}');
            },
          );
        },
      ),
    );
  }
}
