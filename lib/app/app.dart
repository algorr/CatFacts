import 'package:catfacts/app/constants.dart';
import 'package:catfacts/domain/repository/repository.dart';
import 'package:catfacts/domain/viewmodel/cubit/get_cats_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/network/app_api.dart';
import '../presentation/resources/route_manager.dart';
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
    return BlocProvider(
      create: (context) => GetCatsCubit(Repository(AppServiceClient(Dio()))),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteManager.getRoute,
        initialRoute: Routes.homeRoute,
        theme: getAppTheme(),
      ),
    );
  }
}
