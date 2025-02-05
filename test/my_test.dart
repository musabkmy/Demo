import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
// import 'package:flutter/material.dart';
// import 'package:test/test.dart';

/// Defining a typedef for a function signature
// typedef ListMapper<X> = Map<X, List<X>>;
// Map<String, List<String>> m1 = {}; // Verbose.
// ListMapper<String> m2 = {}; // Same thing but shorter and clearer.

///Arrange
///Act
///Assert
void main() {
  test('pattern', () {
    Map<String, int> hist = {
      'a': 23,
      'b': 100,
    };

    for (var MapEntry(:key, :value) in hist.entries) {
      print('$key occurred $value times');
    }

// if (json case {'user': [String name, int age]}) {
//   print('User $name is $age years old.');
// }
  });
  test('pattern list', () {
    var [a, b, c, d, ..., g] = [1, 2, 3, 4, 5, 6, 7];
// Prints "1 2 6 7".
    print('$a $b $c $d');
  });

  // test('enums', () {
  //   Planet.mercury;
  //   Planet.values.length;
  //   Map<int, String> listMap = {1: '', 2: '', 1: '3', 1: '', 1: '', 1: ''};
  //   Set<String> listSet = listMap.values.toSet();
  //   Iterable<String> listIterable = listMap.values;
  //   print(listMap);
  //   print(listSet);
  //   print(listIterable);
  //   // print(listSet.difference({'', '', 'mur'}).toString());
  //   // print(listNum.toSet().toString());
  // });

  // test('variables', () {
  //   List<int> list = [1, 2, 3, 2, 4];
  //   // ignore: unnecessary_type_check
  //   Set<int> mySet = {5, 6};
  //   mySet.addAll(list);
  //   print(mySet); // Output: {1, 2, 3}
  // });

  test('using metadata', () {
    // Todo todo = Todo('who', 'what');
    // todo.doSomething();
    int x = 4;
    x = x >> 1;
    print(x);
  });
  test('typedef', () {
    Map<String, int> hist = {
      'a': 23,
      'b': 100,
    };

    for (var MapEntry(key: key, value: count) in hist.entries) {
      print('$key occurred $count times');
    }
  });

  test('description', () {
    // Create a function that adds 2.
    var add2 = makeAdder(2)(3);

    // Create a function that adds 4.
    var add4 = makeAdder(4);

    print(add2);

    // assert(add2(3) == 5);
    // assert(add4(3) == 7);
  });

  test('sync', () {
    for (var element in naturalsDownFrom(50)) {
      print(element);
    }
  });

  test('switch-case', () {
    switch ('PENDING') {
      case 'OPEN':
        print('open');
        continue newCase; // Continues executing at the newCase label.

      case 'DENIED': // Empty case falls through.
      case 'CLOSED':
      // print('denied-closed'); // Runs for both DENIED and CLOSED,

      newCase:
      case 'PENDING':
        print('pending'); // Runs for both OPEN and PENDING.

      new2Case:
      case 'AKS':
    }
  });
  test('switch cases', () {
    var aNum = 45;

    switch (aNum) {
      case > 0:
        print('> 0');
        continue cased;
      cased:
      case < 10:
        print('< 10');
      default: // Without this, you see a WARNING.
        print(aNum); // 'Color.blue'
    }
  });
}

enum Vehicle implements Comparable<Vehicle> {
  car(tires: 4, passengers: 5, carbonPerKilometer: 400),
  bus(tires: 6, passengers: 50, carbonPerKilometer: 800),
  bicycle(tires: 2, passengers: 1, carbonPerKilometer: 0);

  const Vehicle({
    required this.tires,
    required this.passengers,
    required this.carbonPerKilometer,
  });

  final int tires;
  final int passengers;
  final int carbonPerKilometer;

  int get carbonFootprint => (carbonPerKilometer / passengers).round();

  bool get isTwoWheeled => this == Vehicle.bicycle;

  @override
  int compareTo(Vehicle other) => carbonFootprint - other.carbonFootprint;
}

mixin class Musician {
  int value = 0;

  void printSomething() {
    print('Musician');
  }

  // void somethingElse();
}

class Novice with Musician {
  // Use Musician as a mixin
  // ...
}

class NoviceT extends Musician {
  // Use Musician as a class
  // ...
}

/// Returns a function that adds [addBy] to the
/// function's argument.
Function makeAdder(int addBy) {
  return (int i) {
    return i == 0 ? 3 : addBy + i + makeAdder(5)(i - 1);
  };
}

Iterable<int> naturalsTo(int n) sync* {
  int k = 0;
  while (k < n) yield k++;
}

Iterable<int> naturalsDownFrom(int n) sync* {
  if (n > 0) {
    yield n;
    yield* naturalsDownFrom(n - 1);
  }
}

class Point {
  final double x;
  final double y;
  final double distanceFromOrigin;

  Point(double x, double y)
      : x = x,
        y = y,
        distanceFromOrigin = sqrt(x * x + y * y);
}

class Vector2d {
  final double x, y;
  Vector2d.named({required this.x, required this.y});
}

class Vector3d extends Vector2d {
  final double z;

  // Forward the y parameter to the named super constructor like:
  // Vector3d.yzPlane({required double y, required this.z})
  //       : super.named(x: 0, y: y);
  Vector3d.yzPlane({required super.y, required this.z}) : super.named(x: 0);
}

class A {
  // void jbb() {}
  // Unless you override noSuchMethod, using a
  // non-existent member results in a NoSuchMethodError.
  @override
  void noSuchMethod(Invocation invocation) {
    print('You tried to use a non-existent member: '
        '${invocation.memberName}');
  }
}

/// Can be applied to any type with a [name] property and provides an
/// implementation of [hashCode] and operator `==` in terms of it.
mixin NameIdentity {
  String get name;

  @override
  int get hashCode => name.hashCode;

  @override
  bool operator ==(other) => other is NameIdentity && name == other.name;
}

class Person with NameIdentity {
  final String name;

  Person(this.name);
}
