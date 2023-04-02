import 'package:catfacts/domain/model/cats.dart';
import 'package:catfacts/domain/viewmodel/get/get_cats_cubit.dart';
import 'package:catfacts/presentation/resources/value_manager.dart';
import 'package:catfacts/presentation/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class HomeViewColumn extends StatelessWidget {
  const HomeViewColumn({
    super.key,
    required this.randomCat,
    required this.state,
  });

  final Cats randomCat;
  final GetCatsSuccessfully state;

  @override
  Widget build(BuildContext context) {
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
          edgeInsets: const EdgeInsets.symmetric(horizontal: AppMargin.m16),
          widget: ListTile(
            title: Text(randomCat.text!),
            subtitle: Text(randomCat.createdAt!),
          ),
        )
      ],
    );
  }
}
