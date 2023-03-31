import 'package:bloc/bloc.dart';
import 'package:catfacts/data/network/failure.dart';
import 'package:catfacts/domain/repository/repository.dart';
import 'package:equatable/equatable.dart';

import '../../model/cats.dart';

part 'get_cats_state.dart';

class GetCatsCubit extends Cubit<GetCatsState> {
  final Repository _repository;
  GetCatsCubit(this._repository) : super(GetCatsInitial());

  void fetchCats() {
    emit(GetCatsInitial());
    _repository
        .fetchCats()
        .then((value) => emit(GetCatsSuccessfully(value)))
        .catchError((e) => emit(GetCatsFail(e)));
  }
}
