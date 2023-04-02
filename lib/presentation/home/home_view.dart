import 'package:catfacts/app/constants.dart';
import 'package:catfacts/domain/model/cats.dart';
import 'package:catfacts/domain/viewmodel/get/get_cats_cubit.dart';
import 'package:catfacts/presentation/history/history_view.dart';
import 'package:catfacts/presentation/resources/index.dart';
import 'package:catfacts/presentation/widgets/home_view_colum.dart';
import 'package:catfacts/presentation/widgets/shimmer.dart';
import 'package:catfacts/utils/mixins/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeView extends StatelessWidget with TimeToLocal, RandomCatFact {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appBarTitle),
        actions: [
          IconButton(
              onPressed: () {
                //Navigator.pushReplacementNamed(context, Routes.historyRoute);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const HistoryView()));
              },
              icon: const Icon(IconManager.historyButton))
        ],
      ),
      //* bottom app bar
      bottomNavigationBar: _bottomAppBar(context),
      body: BlocBuilder<GetCatsCubit, GetCatsState>(
        builder: (context, state) {
          if (state is GetCatsInitial) {
            BlocProvider.of<GetCatsCubit>(context).fetchCats();
          }
          if (state is GetCatsSuccessfully) {
            var randomCat = randomFact(state.cats);

            //* Save func for local database
            _saveRandomFacts(randomCat, state);

            //* Column for Cat Facts
            return HomeViewColumn(
              randomCat: randomCat,
              state: state,
            );
          }
          //* shimmer loading animation
          return getShimmerEffect();
        },
      ),
    );
  }

//* BottomAppBar for 'Another Fact'
  BottomAppBar _bottomAppBar(BuildContext context) {
    return BottomAppBar(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
      child: ElevatedButton(
        onPressed: () {
          //context.read<GetCatsCubit>().fetchCats();
          BlocProvider.of<GetCatsCubit>(context).fetchCats();
        },
        child: const Text(AppStrings.anotherFact),
      ),
    );
  }
}

//* Save fact from api to hive
_saveRandomFacts(Cats randomCat, state) async {
  final box = Hive.box(Constants.hiveBox);
  if (state is GetCatsSuccessfully) {
    await box.add(randomCat);
  }
}
