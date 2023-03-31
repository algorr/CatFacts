part of 'get_cats_cubit.dart';

abstract class GetCatsState extends Equatable {
  const GetCatsState();

  @override
  List<Object> get props => [];
}

class GetCatsInitial extends GetCatsState {}

class GetCatsSuccessfully extends GetCatsState {
  final List<Cats> cats;

  const GetCatsSuccessfully(this.cats);

  @override
  List<Object> get props => [cats];
}

class GetCatsFail extends GetCatsState {
  final Failure failure;

  const GetCatsFail(this.failure);
}
