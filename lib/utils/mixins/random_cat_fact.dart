import 'dart:math';
import 'package:catfacts/domain/model/cats.dart';

mixin RandomCatFact {
  Cats randomFact(List<Cats> cats) {
    final random = Random();
    var element = cats[random.nextInt(cats.length)];
    return element;
  }
}
