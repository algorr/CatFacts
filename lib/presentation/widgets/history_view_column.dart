import 'package:catfacts/presentation/resources/index.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class HistoryViewColumn extends StatelessWidget {
  const HistoryViewColumn({
    super.key,
    required this.size,
    required this.box,
  });

  final Size size;
  final Box box;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: size.height,
          width: size.width,
          child: ListView(
            children: [
              ...box.values.map((e) => Card(
                    elevation: AppSize.s10,
                    child: ListTile(
                      title: Text(e.text),
                      subtitle: Text(e.createdAt),
                    ),
                  ))
            ],
          ),
        )
      ],
    );
  }
}
