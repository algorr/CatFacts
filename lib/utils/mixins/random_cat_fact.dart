import 'dart:math';
import 'package:catfacts/domain/model/cats.dart';

mixin RandomCatFact {
  Cats randomFact(List<Cats> cats) {
    final random = Random();
    var element = cats[random.nextInt(cats.length)];
    return element;
  }
}

mixin CatToFact {
  String? catToFact(Cats cats) {
    var element = cats.text;
    return element;
  }
}

mixin CatToCreatedAt {
  String? catToFact(Cats cats) {
    var element = cats.createdAt;
    return element;
  }
}
