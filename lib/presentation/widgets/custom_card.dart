import 'package:catfacts/presentation/resources/value_manager.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.widget, this.edgeInsets});

  final Widget widget;
  final EdgeInsets? edgeInsets;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: edgeInsets,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s10)),
      child: widget,
    );
  }
}
