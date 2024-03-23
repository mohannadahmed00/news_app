import 'package:flutter/material.dart';
import 'package:news_app/models/sources/sources.dart';
import 'package:news_app/shared/styles/app_colors.dart';


class ChipWidget extends StatelessWidget {
  final Sources source;
  final bool selected;

  const ChipWidget(this.source,this.selected, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 8),
      decoration: BoxDecoration(
        color: selected?AppColors.green:Colors.transparent,
        border: Border.all(color: AppColors.green),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Text(
        source.name ?? "",
        style: Theme.of(context)
            .textTheme
            .labelMedium!
            .copyWith(color: selected?Colors.white:AppColors.green),
      ),
    );
  }
}
