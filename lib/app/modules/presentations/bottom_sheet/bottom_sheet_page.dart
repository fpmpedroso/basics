import 'package:basics/app/core/ui/helpers/size_extensions.dart';
import 'package:basics/app/core/ui/styles/colors_app.dart';
import 'package:basics/app/core/ui/styles/texts_app.dart';
import 'package:flutter/material.dart';

class BottomSheetPage extends StatelessWidget {

  const BottomSheetPage({ super.key });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Containers'),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 6, right: 6, bottom: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '# Pop-up bottom (BottomSheet)',
                style: context.textsApp.textBold
                    .copyWith(fontSize: 16, color: context.colors.darkBlue),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                '> 1) Possibilidade de mostrar um pop-up',
                style: context.textsApp.textRegular
                    .copyWith(fontSize: 14, color: context.colors.darkGrey),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context, 
                      builder: (context) {
                        return SizedBox(
                          height: context.percentHeight(.5),
                          child: Text(
                            'Conteúdo a ser demonstrado',
                            style: context.textsApp.textRegular.copyWith(
                              fontSize: 14,
                              color: context.colors.darkGrey
                            ),
                          ),
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.colors.lightOrange,
                    shadowColor: context.colors.lightGrey,
                    minimumSize: const Size(120, 35),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text('Abrir'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}