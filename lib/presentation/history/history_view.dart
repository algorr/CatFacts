import 'package:catfacts/app/constants.dart';
import 'package:catfacts/domain/model/cats.dart';
import 'package:catfacts/presentation/resources/route_manager.dart';
import 'package:catfacts/presentation/widgets/custom_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('History Facts'),
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, Routes.homeRoute);
            },
            icon: Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final box = Hive.box(Constants.hiveBox);

          print('History view : ${box.values}');
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 500,
                  width: 500,
                  child: ListView(
                    children: [
                      ...box.values.map((e) => ListTile(
                            title: Text(e.text),
                            subtitle: Text(e.createdAt),
                          ))
                    ],
                  ),
                )
                /*    SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(cats[index].text!),
                    );
                  }),
                ), */
              ],
            ),
          );
        },
      ),
    );
  }
}

/* Future<void> getLocalFacts() async {
  final hiveBox = Hive.box(Constants.hiveBox);
  final data = hiveBox.keys.map((e) {
    final item = hiveBox.get(e);
    print(item['text']);
    return {"e": e, "fact": item["text"], "createdAt": item['createdAt']};
  }).toList();
} */
