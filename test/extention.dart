Record record = (int, String);

extension type IdNumber(int id) implements int {
  // Wraps the 'int' type's '<' operator:
  operator <(IdNumber other) => id < other.id;
  // Custom equality check method:
  bool equals(IdNumber other) => id == other.id;

  // Doesn't declare the '+' operator, for example,
  // because addition does not make sense for ID numbers.
}

extension type const E._(int it) {
  E() : this._(42);
  E.otherName(this.it);
}
