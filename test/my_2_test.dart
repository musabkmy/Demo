import 'package:flutter_test/flutter_test.dart';

import 'extention.dart';

extension on String {
  bool get isBlank => this.trim().isEmpty;
}

void main() {
  test('Extention', () {
    expect('Musaga'.isBlank, isTrue);
  });

  test('extention type', () {
    int myUnsafeId = 42424242;
    myUnsafeId =
        myUnsafeId + 10; // This works, but shouldn't be allowed for IDs.

    var safeId = IdNumber(42424242);
    // safeId + 10; // Compile-time error: No '+' operator.
    // myUnsafeId = safeId; // Compile-time error: Wrong type.
    myUnsafeId = safeId as int; // OK: Run-time cast to representation type.
    safeId < IdNumber(42424241); // OK: Uses wrapped '<' operator.
    print(safeId.id);
  });
}
