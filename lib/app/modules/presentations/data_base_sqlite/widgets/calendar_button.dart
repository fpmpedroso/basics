import 'package:basics/app/core/ui/styles/colors_app.dart';
import 'package:basics/app/core/ui/styles/texts_app.dart';
import 'package:basics/app/modules/presentations/data_base_sqlite/data_base_sqlite_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CalendarButton extends StatelessWidget {
  CalendarButton({Key? key}) : super(key: key);

  //importa-se o pacote Intl para formatar a data
  final dateFormat = DateFormat('dd/MM/y');

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

        //aciona-se o método set da controller para inserir a data que a pessoa escolheu
        context.read<DataBaseSqliteController>().selectedDate = selectedDate;
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
            Selector<DataBaseSqliteController, DateTime?>(
              selector: (context, controller) => controller.selectedDate,
              builder: (context, selectedDate, child) {
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
