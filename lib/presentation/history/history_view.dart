import 'package:catfacts/app/constants.dart';
import 'package:catfacts/presentation/resources/index.dart';
import 'package:catfacts/presentation/widgets/history_view_column.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.historyAppbarTitle),
        leading: IconButton(
            onPressed: () {
              //Navigator.pushReplacementNamed(context, Routes.homeRoute);
              Navigator.pop(context);
            },
            icon: const Icon(IconManager.backButton)),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          //* instance of local database hive
          final box = Hive.box(Constants.hiveBox);
          return SingleChildScrollView(
            //* History view widget's column
            child: HistoryViewColumn(size: size, box: box),
          );
        },
      ),
    );
  }
}
