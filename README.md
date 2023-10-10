<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->


  The package contains immutable value objects
  <b>PositiveInt</b> and <b>PositiveDouble</b>
  that encapsulate a positive number (any number greater than 0)
  which can be <b>int</b> or <b>double</b>.
  The value objects guarantee that their value is always positive
  and can't be changed after creation.
  They can't be created with 0 or a negative value.

## Getting started

### How to start using the package

> dart pub add positive_num


Or specify the package's git url in pubspec.yaml at the dependencies section.

```
dependencies:
  positive_num:
    git:
      url: https://github.com/maxeema/positive_num.git
```

Then import it in your code.

```dart
import 'package:positive_num/positive_num.dart';
```

## Usage

```dart
import 'package:positive_num/positive_num.dart';

void main() {
  var someNumber = 1;
  //
  final (:error, :instance) = PositiveInt.create(someNumber);
  if (instance != null) {
    final positiveInt = instance;
    print('Created a PositiveInt, value: $positiveInt');
  } else {
    print('Error. $error');
  }
}
```

## Before run

> dart pub get

## Run example

> dart run example/positive_num_example.dart

## Run tests

> dart test


## Copyright

© Max Shemetov, 2023
