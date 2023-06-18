import 'package:basics/app/core/ui/helpers/size_extensions.dart';
import 'package:basics/app/core/ui/styles/colors_app.dart';
import 'package:flutter/material.dart';

class RowMenuWidget extends StatelessWidget {
  const RowMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            color: context.colors.darkBlue,
            width: context.percentWidth(0.45),
            height: context.percentWidth(0.35),
          ),
          Container(
            color: context.colors.darkOrange,
            width: context.percentWidth(0.45),
            height: context.percentWidth(0.35),
          ),
        ],
      ),
    );
  }
}
