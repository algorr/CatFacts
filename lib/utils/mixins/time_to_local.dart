import 'package:intl/intl.dart';

mixin TimeToLocal {
  DateTime toLocal(String date) {
    DateTime localTime = DateTime.parse(date).toLocal();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return localTime;
  }
}
