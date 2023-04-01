import 'package:hive/hive.dart';

part 'facts.g.dart';

@HiveType(typeId: 0)
class Facts {
  @HiveField(0)
  final String fact;
  @HiveField(1)
  final String createdAt;

  Facts(this.fact, this.createdAt);
}
