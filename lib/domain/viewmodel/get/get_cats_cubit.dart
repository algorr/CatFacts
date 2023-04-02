import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:catfacts/app/constants.dart';
import 'package:catfacts/domain/repository/repository.dart';
import 'package:catfacts/utils/mixins/random_cat_fact.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../model/cats.dart';

part 'get_cats_state.dart';

class GetCatsCubit extends Cubit<GetCatsState> with RandomCatFact {
  final Repository _repository;
  GetCatsCubit(this._repository) : super(GetCatsInitial());

  //* Fetch Cat Facts from API
  void fetchCats() async {
    try {
      //* get cat list from api
      final catFacts = await _repository.fetchCats();

      //* refresh to new image
      Uint8List bytes =
          (await NetworkAssetBundle(Uri.parse(Constants.randomImageUrl))
                  .load(Constants.randomImageUrl))
              .buffer
              .asUint8List();
      final nextImage = Image.memory(
        bytes,
        key: ValueKey(Random().nextInt(2)),
      );
      if (catFacts.isNotEmpty) {
        emit(GetCatsSuccessfully(catFacts, nextImage));
        //toggleLoading();
      } else {
        emit(GetCatsFail());
      }
    } catch (e) {
      throw Exception();
    }
  }

  //* refresh cat facts
  void refreshCatFacts() {
    emit(GetCatsInitial());
  }
}
