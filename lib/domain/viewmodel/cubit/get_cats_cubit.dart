import 'package:bloc/bloc.dart';
import 'package:catfacts/app/constants.dart';
import 'package:catfacts/domain/model/facts.dart';
import 'package:catfacts/domain/repository/repository.dart';
import 'package:catfacts/utils/mixins/random_cat_fact.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../model/cats.dart';

part 'get_cats_state.dart';

class GetCatsCubit extends Cubit<GetCatsState> with RandomCatFact {
  final Repository _repository;
  GetCatsCubit(this._repository) : super(GetCatsInitial());

  bool isLoading = false;
  List<Facts> factList = [];

  //* Fetch Cat Facts from API
  void fetchCats() async {
    emit(GetCatsInitial());
    try {
      final catFacts = await _repository.fetchCats();
      final fact = randomFact(catFacts);
      final nextImage = Image.network(Constants.randomImageUrl);
      if (catFacts.isNotEmpty) {
        emit(GetCatsSuccessfully(catFacts, nextImage));
        //saveLocal(catFacts);
        toggleLoading();
      } else {
        emit(GetCatsFail());
      }
    } catch (e) {
      print(e);
    }
  }

  /* Future<void> saveLocal(List<Cats> cats) async {
    final cat = randomFact(cats);
    await _factsBox.add(cat);
  } */

  Future<void> saveLocal(List<Cats> cats) async {}

  void toggleLoading() {
    isLoading = !isLoading;
  }
}
