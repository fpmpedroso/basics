import 'package:basics/app/core/ui/helpers/size_extensions.dart';
import 'package:basics/app/core/ui/styles/colors_app.dart';
import 'package:basics/app/core/ui/styles/texts_app.dart';
import 'package:flutter/material.dart';

class ItemRowComponent extends StatelessWidget {
  final String _textItem;
  final Color _colorItem;
  final IconData _iconItem;
  final String _urlItem;

  const ItemRowComponent(
      {super.key,
      required String textItem,
      required Color colorItem,
      required IconData iconItem,
      required String urlItem,
  }) :  _textItem = textItem,
        _colorItem = colorItem,
        _iconItem = iconItem,
        _urlItem = urlItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(_urlItem);
      },
      child: Container(
        width: context.percentWidth(0.45),
        height: context.percentWidth(0.30),
        color: _colorItem,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              _iconItem,
              color: context.colors.whiteApp,
              size: context.percentWidth(0.15),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                _textItem,
                style: context.textsApp.textBold
                    .copyWith(fontSize: 16, color: context.colors.whiteApp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
