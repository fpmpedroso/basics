import 'package:basics/app/core/ui/styles/colors_app.dart';
import 'package:basics/app/core/ui/styles/texts_app.dart';
import 'package:basics/app/modules/presentations/data_sqlite/data_sqlite_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CalendarWidget extends StatelessWidget {
  
  //importa-se o pacote Intl para formatar a data
  final dateFormat = DateFormat('dd/MM/y');

  CalendarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        var lastDate = DateTime.now();
        lastDate = lastDate.add(const Duration(days: 10 * 365));

        final DateTime? selectedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: lastDate);

        //aciona-se o método set da controller para inserir a data que a pessoa escolheu e logo em seguida os ouvintes são acionados
        // ignore: use_build_context_synchronously
        context.read<DataSqliteController>().selectedDate = selectedDate;
      },
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(
              color: context.colors.darkGrey,
            ),
            borderRadius: BorderRadius.circular(30)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.today,
              color: context.colors.lightBlue,
            ),
            const SizedBox(
              height: 10,
            ),
            //envolve-se com uma Selector para realizar alterações de estado
            Selector<DataSqliteController, DateTime?>(
              selector: (_, controller) => controller.selectedDate,
              builder: (_, selectedDate, __) {
                //formata-se a data
                if (selectedDate != null) {
                  return Text(
                    dateFormat.format(selectedDate),
                    style: context.textsApp.textRegular,
                  );
                } else {
                  return Text(
                    'Selecione uma data',
                    style: context.textsApp.textRegular,
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
