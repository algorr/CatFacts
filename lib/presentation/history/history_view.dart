import 'package:catfacts/app/constants.dart';
import 'package:catfacts/domain/model/cats.dart';
import 'package:catfacts/domain/viewmodel/cubit/get_cats_cubit.dart';
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
          //getLocalFacts();
          return ValueListenableBuilder(
              valueListenable: Hive.box(Constants.hiveBox).listenable(),
              builder: (context, box, widget) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      for (List cats in box.values)
                        SizedBox(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                              itemCount: cats.length,
                              itemBuilder: (context, index) {
                                print('Listenin uzunluğu : ${cats.length}');
                                return Card(
                                  child: ListTile(
                                    title: Text(cats[index].text!),
                                    subtitle: Text(cats[index].createdAt!),
                                  ),
                                );
                              }),
                        ),
                    ],
                  ),
                );
              });
        },
      ),
    );
  }
}

Future<void> getLocalFacts() async {
  final hiveBox = Hive.box(Constants.hiveBox);
  final data = hiveBox.keys.map((e) {
    final item = hiveBox.get(e);
    print(item['text']);
    //return {"e": e, "fact": item["text"], "createdAt": item['createdAt']};
  }).toList();
}
