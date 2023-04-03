import 'package:catfacts/domain/locator/locator.dart';
import 'package:catfacts/domain/viewmodel/get/get_cats_cubit.dart';
import 'package:catfacts/presentation/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../presentation/resources/theme_manager.dart';

class MyApp extends StatefulWidget {
  //const MyApp({super.key}); // default constructor

  const MyApp._internal(); // private named constructor

  static const MyApp instance =
      MyApp._internal(); // single instance -- singleton

  factory MyApp() => instance; // factory for the class instance

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetCatsCubit>(
      create: (context) => getIt.call(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomeView(),
        theme: getAppTheme(),
      ),
    );
  }
}
