
import 'package:basics/app/core/ui/styles/colors_app.dart';
import 'package:basics/app/core/ui/styles/texts_app.dart';
import 'package:flutter/material.dart';

class DialogCustom extends Dialog{
  DialogCustom({
    required BuildContext context,
    super.key,
  }) : super(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12)
    ),
    child: Container(
      width: 300,
      height: 300,
      color: context.colors.whiteApp,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              'Título',
              style: context.textsApp.textBold
                  .copyWith(fontSize: 14, color: context.colors.darkGrey),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(), 
            child: const Text('Fechar'),
          ),
        ],
      ),
    ),
  );
  
}