import 'package:catfacts/app/constants.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'app/app.dart';
import 'domain/model/facts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(Constants.hiveBox);
  Hive.registerAdapter(FactsAdapter());

  runApp(MyApp());
}
