import 'package:catfacts/domain/viewmodel/cubit/get_cats_cubit.dart';
import 'package:catfacts/presentation/resources/icon_manager.dart';
import 'package:catfacts/presentation/resources/route_manager.dart';
import 'package:catfacts/presentation/resources/value_manager.dart';
import 'package:catfacts/presentation/widgets/custom_card.dart';
import 'package:catfacts/presentation/widgets/shimmer.dart';
import 'package:catfacts/utils/mixins/random_cat_fact.dart';
import 'package:catfacts/utils/mixins/time_to_local.dart';
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
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, Routes.historyRoute);
              },
              icon: const Icon(IconManager.historyButton))
        ],
      ),
      bottomNavigationBar: _bottomAppBar(context),
      body: BlocBuilder<GetCatsCubit, GetCatsState>(
        builder: (context, state) {
          if (state is GetCatsSuccessfully) {
            var randomCat = randomFact(state.cats);
            return Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .7,
                  height: MediaQuery.of(context).size.height * .4,
                  child: CustomCard(
                    widget: state.newImage,
                  ),
                ),
                const SizedBox(
                  height: AppPadding.p10,
                ),
                CustomCard(
                  edgeInsets:
                      const EdgeInsets.symmetric(horizontal: AppMargin.m16),
                  widget: ListTile(
                    title: Text(randomCat.text!),
                    subtitle: Text(randomCat.createdAt!),
                  ),
                )
              ],
            );
          }
          return getShimmerEffect();
        },
      ),
    );
  }

  BottomAppBar _bottomAppBar(BuildContext context) {
    return BottomAppBar(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
      child: ElevatedButton(
        onPressed: () {
          context.read<GetCatsCubit>().fetchCats();
        },
        child: const Text(AppStrings.anotherFact),
      ),
    );
  }
}
