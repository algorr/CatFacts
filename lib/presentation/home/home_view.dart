import 'package:catfacts/app/constants.dart';
import 'package:catfacts/domain/model/cats.dart';
import 'package:catfacts/domain/viewmodel/cubit/get_cats_cubit.dart';
import 'package:catfacts/utils/mixins/random_cat_fact.dart';
import 'package:catfacts/utils/mixins/time_to_local.dart';
import 'package:catfacts/presentation/widgets/custom_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../resources/string_manager.dart';

class HomeView extends StatelessWidget with TimeToLocal, RandomCatFact {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GetCatsCubit>(context).fetchCats();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(AppStrings.appBarTitle),
      ),
      body: BlocBuilder<GetCatsCubit, GetCatsState>(builder: (context, state) {
        if (state is GetCatsSuccessfully) {
          List<Cats> cats = state.cats;
          var randomCatFact = randomFact(cats);
          return Card(
            child: ListTile(
              title: Image.network(Constants.randomImageUrl),
              subtitle: Text(randomCatFact.text!),
            ),
          );
        }
        return const CustomCircularProgressIndicator();
      }),
    );
  }
}
/* 
   return ListView.builder(
                itemCount: cats.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Image.network(Constants.randomImageUrl),
                      title: Text(cats[index].text!),
                      subtitle:
                          Text(toLocal(cats[index].createdAt!).toString()),
                    ),
                  );
                },
              ); */