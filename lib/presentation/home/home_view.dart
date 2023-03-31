import 'package:catfacts/data/network/app_api.dart';
import 'package:catfacts/domain/viewmodel/cubit/get_cats_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final client = AppServiceClient(Dio());
    return BlocBuilder<GetCatsCubit, GetCatsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('Cat Facts'),
          ),
          body: FutureBuilder(
            future: client.fetch(),
            builder: (context, snapshot) {
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(snapshot.data![index].text!),
                    );
                  });
            },
          ),
        );
      },
    );
  }
}
