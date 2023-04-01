/* extension TimeToLocal on DateTime {
  DateTime toLocal(String date) {
    DateTime localTime = DateTime.parse(date).toLocal();
    return localTime;
  }
}
 */

mixin TimeToLocal {
  DateTime toLocal(String date) {
    DateTime localTime = DateTime.parse(date).toLocal();
    return localTime;
  }
}
