import 'package:basics/app/core/ui/helpers/size_extensions.dart';
import 'package:basics/app/core/ui/styles/colors_app.dart';
import 'package:basics/app/modules/presentations/data_sqlite/data_sqlite_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ListViewDados extends StatefulWidget {
  //recebe-se uma instância da controller
  final DataSqliteController _controller;

  const ListViewDados({Key? key, required DataSqliteController controller})
      : _controller = controller,
        super(key: key);

  @override
  State<ListViewDados> createState() => _ListViewDadosState();
}

class _ListViewDadosState extends State<ListViewDados> {
  //formatação de datas
  final dateFormat = DateFormat('dd/MM/y');

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.percentWidth(0.8),
      height: context.percentWidth(0.6),
      child: Consumer<DataSqliteController>(
        builder: (_, controller, __) {
          return ListView.builder(
            padding: const EdgeInsets.only(left: 10),
            itemCount: controller.listaDados.length,
            itemBuilder: (context, index) {
              return Slidable(
                endActionPane:
                    ActionPane(motion: const DrawerMotion(), children: [
                  SlidableAction(
                    onPressed: (context) {
                      widget._controller.delete(controller.listaDados[index].id);
                    },
                    //label: '$index',
                    backgroundColor: context.colors.redWarning,
                    icon: Icons.delete,
                  ),
                ]),
                child: ListTile(
                  title: Text(controller.listaDados[index].descricao),
                  subtitle: Text(
                    dateFormat.format(controller.listaDados[index].dateTime),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
