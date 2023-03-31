//* extensions on String

extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return "";
    }
    return this!;
  }
}

//* extensions on int

extension NonNullInt on int? {
  int orZero() {
    if (this == null) {
      return 0;
    }
    return this!;
  }
}
