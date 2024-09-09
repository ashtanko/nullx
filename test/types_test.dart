import 'package:nullx/nullx.dart';
import 'package:test/test.dart';

import 'test_data.dart';

void main() {
  group('Nullable types tests [DEPRECATED]', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('Should call the provided function if the nullableBoolean is not null',
        () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const bool? nullableBoolean = true;
      bool called = false;

      // ignore: deprecated_member_use_from_same_package
      unwrapped(nullableBoolean, (value) {
        called = true;
      });

      expect(called, true);
    });

    test('Should not call the provided function if the nullableBoolean is null',
        () {
      // ignore: avoid_init_to_null
      const bool? nullableBoolean = null;
      bool called = false;

      // ignore: deprecated_member_use_from_same_package
      unwrapped(nullableBoolean, (value) {
        called = true;
      });

      expect(called, false);
    });

    test('Should call the provided function if the nullableInt is not null',
        () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const int? nullableInt = 42;
      bool called = false;

      // ignore: deprecated_member_use_from_same_package
      unwrapped(nullableInt, (value) {
        called = true;
      });

      expect(called, true);
    });

    test('Should not call the provided function if the nullableInt is null',
        () {
      // ignore: avoid_init_to_null
      const int? nullableInt = null;
      bool called = false;

      // ignore: deprecated_member_use_from_same_package
      unwrapped(nullableInt, (value) {
        called = true;
      });

      expect(called, false);
    });

    test('Should call the provided function if the nullableString is not null',
        () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const String? nullableString = 'hello';
      bool called = false;

      // ignore: deprecated_member_use_from_same_package
      unwrapped(nullableString, (value) {
        called = true;
      });

      expect(called, true);
    });

    test('Should not call the provided function if the nullableString is null',
        () {
      // ignore: avoid_init_to_null
      const String? nullableString = null;
      bool called = false;

      // ignore: deprecated_member_use_from_same_package
      unwrapped(nullableString, (value) {
        called = true;
      });

      expect(called, false);
    });
  });

  // todo remove in v0.1.8
  group('executeIf tests [DEPRECATED]', () {
    test('executeIfNotSingleLambdaTest', () {
      String? nullableString;

      // ignore: deprecated_member_use_from_same_package
      executeIf(
        () => nullableString == null || nullableString!.isEmpty,
        onConditionMet: () => nullableString = 'conditionMet',
        onConditionNotMet: () => nullableString = 'conditionNotMet',
      );

      expect(nullableString, 'conditionMet');

      nullableString = '';
      // ignore: deprecated_member_use_from_same_package
      executeIf(
        () => nullableString == null || nullableString!.isNotEmpty,
        onConditionMet: () => nullableString = 'conditionMet',
        onConditionNotMet: () => nullableString = 'conditionNotMet',
      );

      expect(nullableString, 'conditionNotMet');
    });

    test('executeIf - condition met', () {
      bool conditionMet = false;

      // ignore: deprecated_member_use_from_same_package
      executeIf(
        () => true, // Condition always met
        onConditionMet: () => conditionMet = true,
        onConditionNotMet: () => conditionMet = false,
      );

      expect(conditionMet, true); // Expecting conditionMet to be true
    });

    test('executeIf - condition not met', () {
      bool conditionMet = false;

      // ignore: deprecated_member_use_from_same_package
      executeIf(
        () => false, // Condition never met
        onConditionMet: () => conditionMet = true,
        onConditionNotMet: () => conditionMet = false,
      );

      expect(conditionMet, false); // Expecting conditionMet to be false
    });
  });

  // todo remove in v0.1.8
  group('String types tests [DEPRECATED]', () {
    test(
        'Should call the provided function if the nullableString is not null and not empty',
        () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const String? nullableString = 'hello';
      bool called = false;

      // ignore: deprecated_member_use_from_same_package
      notEmpty(nullableString, (value) {
        called = true;
      });

      expect(called, true);
    });

    test('Should not call the provided function if the nullableString is null',
        () {
      // ignore: avoid_init_to_null
      const String? nullableString = null;
      bool called = false;

      // ignore: deprecated_member_use_from_same_package
      notEmpty(nullableString, (value) {
        called = true;
      });

      expect(called, false);
    });

    test('Should not call the provided function if the nullableString is empty',
        () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const String? nullableString = '';
      bool called = false;

      // ignore: deprecated_member_use_from_same_package
      notEmpty(nullableString, (value) {
        called = true;
      });

      expect(called, false);
    });
  });

  group('callWhen', () {
    test('calls onMet when condition is true', () {
      var onMetCalled = false;
      var onNotMetCalled = false;

      callWhen(
        condition: () => true,
        onMet: () => onMetCalled = true,
        onNotMet: () => onNotMetCalled = true,
      );

      expect(onMetCalled, isTrue);
      expect(onNotMetCalled, isFalse);
    });

    test('calls onNotMet when condition is false', () {
      var onMetCalled = false;
      var onNotMetCalled = false;

      callWhen(
        condition: () => false,
        onMet: () => onMetCalled = true,
        onNotMet: () => onNotMetCalled = true,
      );

      expect(onMetCalled, isFalse);
      expect(onNotMetCalled, isTrue);
    });
  });

  group('conditionNotNullAs', () {
    test(
        'should return conditionTrue result if object is not null and condition is true',
        () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const int? number = 10;
      final result = number.conditionNotNullAs<int>(
        condition: (value) => value > 5,
        isTrue: (value) => value * 2,
        isFalse: () => -1,
      );
      expect(result, equals(20));
    });

    test(
        'should return conditionFalse result if object is not null and condition is false',
        () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const int? number = 3;
      final result = number.conditionNotNullAs<int>(
        condition: (value) => value > 5,
        isTrue: (value) => value * 2,
        isFalse: () => -1,
      );
      expect(result, equals(-1));
    });

    test('should return conditionFalse result if object is null', () {
      const int? number = null;
      final result = number.conditionNotNullAs<int>(
        condition: (value) => value > 5,
        isTrue: (value) => value * 2,
        isFalse: () => -1,
      );
      expect(result, equals(-1));
    });

    test(
        'uses default condition for non-null input when no condition is provided',
        () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const String? str = 'Hello';
      final result = str.conditionNotNullAs(
        isTrue: (value) => 'True',
        isFalse: () => 'False',
      );
      expect(result, equals('True'));
    });
  });

  group('ifNull', () {
    test('ifNull calls action when the value is null', () {
      const int? value = null;
      bool wasCalled = false;

      value.ifNull(() {
        wasCalled = true;
      });

      expect(wasCalled, isTrue);
    });

    test('ifNull does not call action when the value is not null', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const int? value = 10;
      bool wasCalled = false;

      value.ifNull(() {
        wasCalled = true;
      });

      expect(wasCalled, isFalse);
    });

    test('ifNull returns the original value when the value is null', () {
      const int? value = null;

      final result = value.ifNull(() {});

      expect(result, isNull);
    });

    test('ifNull returns the original value when the value is not null', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const int? value = 10;

      final result = value.ifNull(() {});

      expect(result, equals(10));
    });
  });

  group('notNullWith', () {
    test('returns isTrue when the object is not null', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const String? value = 'test';
      final result = value.notNullWith(
        isTrue: (v) => 'Value is $v',
        isFalse: () => 'Value is null',
      );
      expect(result, 'Value is test');
    });

    test('returns isFalse when the object is null', () {
      String? value;
      final result = value.notNullWith(
        isTrue: (v) => 'Value is $v',
        isFalse: () => 'Value is null',
      );
      expect(result, 'Value is null');
    });

    test('handles complex object correctly', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      final Map<String, dynamic>? map = {'key': 'value'};
      final result = map.notNullWith(
        isTrue: (v) => 'Map is not empty',
        isFalse: () => 'Map is null',
      );
      expect(result, 'Map is not empty');
    });

    test('handles null complex object', () {
      Map<String, dynamic>? map;
      final result = map.notNullWith(
        isTrue: (v) => 'Map is not empty',
        isFalse: () => 'Map is null',
      );
      expect(result, 'Map is null');
    });
  });

  group('conditionNotNullWith (deprecated)', () {
    test('conditionNotNullWith - not null', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const String? nullableString = 'notNull';

      // ignore: deprecated_member_use_from_same_package
      final int length = nullableString.conditionNotNullWith(
        isTrue: (it) => it.length,
        isFalse: () => 0,
      );

      expect(length, 7); // Expecting length to be 7
    });

    test('conditionNotNullWith - null', () {
      String? nullableString;

      // ignore: deprecated_member_use_from_same_package
      final int length = nullableString.conditionNotNullWith(
        isTrue: (it) => it.length,
        isFalse: () => 0,
      );

      expect(length, 0); // Expecting length to be 0
    });

    test('conditionNotNullWith - custom object', () {
      //ignore: unnecessary_nullable_for_final_variable_declarations
      final CustomObject? nullableObject = CustomObject(42);

      // ignore: deprecated_member_use_from_same_package
      final int result = nullableObject.conditionNotNullWith(
        isTrue: (obj) => obj.val * 2,
        isFalse: () => -1,
      );

      expect(result, 84); // Expecting result to be 84
    });

    test('conditionNotNullWith - custom object and null', () {
      CustomObject? nullableObject;

      // ignore: deprecated_member_use_from_same_package
      final int result = nullableObject.conditionNotNullWith(
        isTrue: (obj) => obj.val * 2,
        isFalse: () => -99,
      );

      expect(result, -99); // Expecting result to be 84
    });
  });

  group('TakeIfExtension', () {
    test('takeIf should return value if predicate is true', () {
      const value = 10;
      final result = value.takeIf((value) => value > 5);
      expect(result, equals(value));
    });

    test('takeIf should return null if predicate is false', () {
      const value = 10;
      final result = value.takeIf((value) => value > 20);
      expect(result, isNull);
    });

    test('takeIf should work with different types', () {
      const stringValue = 'Hello';
      final resultString = stringValue.takeIf((value) => value.isNotEmpty);
      expect(resultString, equals(stringValue));

      final listValue = [1, 2, 3];
      final resultList = listValue.takeIf((value) => value.isNotEmpty);
      expect(resultList, equals(listValue));

      final mapValue = {'key': 'value'};
      final resultMap = mapValue.takeIf((value) => value.isNotEmpty);
      expect(resultMap, equals(mapValue));
    });
  });

  group('TakeUnlessExtension', () {
    test('takeUnless should return null if predicate is true', () {
      const value = 10;
      final result = value.takeUnless((value) => value > 5);
      expect(result, isNull);
    });

    test('takeUnless should return value if predicate is false', () {
      const value = 10;
      final result = value.takeUnless((value) => value > 20);
      expect(result, equals(value));
    });

    test('takeUnless should work with different types', () {
      const stringValue = 'Hello';
      final resultString = stringValue.takeUnless((value) => value.isEmpty);
      expect(resultString, equals(stringValue));

      final listValue = [1, 2, 3];
      final resultList = listValue.takeUnless((value) => value.isEmpty);
      expect(resultList, equals(listValue));

      final mapValue = {'key': 'value'};
      final resultMap = mapValue.takeUnless((value) => value.isEmpty);
      expect(resultMap, equals(mapValue));
    });
  });

  group('LetExtension', () {
    test('let should return result of block if object is not null', () {
      const nullableString = 'Hello';
      final result = nullableString.let((value) => value.toUpperCase());
      expect(result, equals('HELLO'));
    });

    test('let should return null if object is null', () {
      const nullableString = null;
      // ignore: avoid_dynamic_calls
      final result = nullableString?.let((value) => value.toUpperCase());
      expect(result, isNull);
    });

    test('let should call the block function and return its result', () {
      const value = 10;
      final result = value.let((value) => 'The number is: $value');
      expect(result, equals('The number is: 10'));
    });

    test('let should work with different types', () {
      const stringValue = 'Hello';
      final resultString = stringValue.let((value) => value.toUpperCase());
      expect(resultString, equals('HELLO'));

      final listValue = [1, 2, 3];
      final resultList = listValue.let((value) => value.length);
      expect(resultList, equals(3));

      final mapValue = {'key': 'value'};
      final resultMap = mapValue.let((value) => value.keys.toList());
      expect(resultMap, equals(['key']));
    });
  });

  group('NullableLetExtension', () {
    test('letNonNull should return result of block if object is not null', () {
      const nullableString = 'Hello';
      final result = nullableString.letNonNull((value) => value.toUpperCase());
      expect(result, equals('HELLO'));
    });

    test('letNonNull should return null if object is null', () {
      const nullableString = null;
      // ignore: avoid_dynamic_calls
      final result = nullableString?.letNonNull((value) => value.toUpperCase());
      expect(result, isNull);
    });

    test('letNonNull should work with different types', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const int? nullableInt = 10;
      final resultInt = nullableInt.letNonNull((value) => value * 2);
      expect(resultInt, equals(20));

      final nullableList = [1, 2, 3];
      final resultList = nullableList.letNonNull((value) => value.length);
      expect(resultList, equals(3));

      final nullableMap = {'key': 'value'};
      final resultMap = nullableMap.letNonNull((value) => value.keys.toList());
      expect(resultMap, equals(['key']));
    });
  });

  group('NotEmptyExtension', () {
    test('calls the function with a non-null, non-empty string', () {
      var called = false;
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const String? value = 'test';
      value.notEmpty((v) {
        called = true;
        expect(v, value);
      });
      expect(called, isTrue);
    });

    test('does not call the function with a null string', () {
      var called = false;
      const String? value = null;
      value.notEmpty((v) {
        called = true;
      });
      expect(called, isFalse);
    });

    test('does not call the function with an empty string', () {
      var called = false;
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const String? value = '';
      value.notEmpty((v) {
        called = true;
      });
      expect(called, isFalse);
    });

    test('calls the function with the correct type', () {
      var called = false;
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const String? value = 'test';
      value.notEmpty((v) {
        called = true;
        expect(v, isA<String>());
        expect(v, value);
      });
      expect(called, isTrue);
    });
  });

  group('UnwrappedExtension', () {
    test('calls the function with a non-null value', () {
      var called = false;
      const value = 42;
      value.unwrapped((v) {
        called = true;
        expect(v, value);
      });
      expect(called, isTrue);
    });

    test('does not call the function with a null value', () {
      var called = false;
      const int? value = null;
      value.unwrapped((v) {
        called = true;
      });
      expect(called, isFalse);
    });

    test('calls the function with the correct type', () {
      var called = false;
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const String? value = 'test';
      value.unwrapped((v) {
        called = true;
        expect(v, isA<String>());
        expect(v, value);
      });
      expect(called, isTrue);
    });
  });

  group('executeIfAs', () {
    test('returns the result of onConditionMet when condition is met', () {
      final result = executeIfAs(
        () => true,
        ifTrue: () => 'Condition met',
        ifFalse: () => 'Condition not met',
      );
      expect(result, 'Condition met');
    });

    test('returns the result of onConditionNotMet when condition is not met',
        () {
      final result = executeIfAs(
        () => false,
        ifTrue: () => 'Condition met',
        ifFalse: () => 'Condition not met',
      );
      expect(result, 'Condition not met');
    });

    test('returns the correct type when condition is met', () {
      final result = executeIfAs(
        () => true,
        ifTrue: () => 42,
        ifFalse: () => 0,
      );
      expect(result, isA<int>());
      expect(result, 42);
    });

    test('returns the correct type when condition is not met', () {
      final result = executeIfAs(
        () => false,
        ifTrue: () => 42,
        ifFalse: () => 0,
      );
      expect(result, isA<int>());
      expect(result, 0);
    });

    test('returns different types based on condition', () {
      final result = executeIfAs(
        () => true,
        ifTrue: () => 'Condition met',
        ifFalse: () => 0,
      );
      expect(result, isA<String>());
      expect(result, 'Condition met');

      final result2 = executeIfAs(
        () => false,
        ifTrue: () => 'Condition met',
        ifFalse: () => 0,
      );
      expect(result2, isA<int>());
      expect(result2, 0);
    });
  });

  group('NullableStringExtensions', () {
    test('isNullOrEmpty returns true for null string', () {
      const String? str = null;
      expect(str.isNullOrEmpty, isTrue);
    });

    test('isNullOrEmpty returns true for empty string', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const String? str = '';
      expect(str.isNullOrEmpty, isTrue);
    });

    test('isNullOrEmpty returns false for non-empty string', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const String? str = 'Hello';
      expect(str.isNullOrEmpty, isFalse);
    });

    test('orDefault returns the string if not null', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const String? str = 'Hello';
      expect(str.orDefault('Default'), equals('Hello'));
    });

    test('orDefault returns default value for null string', () {
      const String? str = null;
      expect(str.orDefault('Default'), equals('Default'));
    });
  });

  group('NullableIntX extension', () {
    test('orZero returns zero when integer is null', () {
      const int? nullableInt = null;
      expect(nullableInt.orZero, equals(0));
    });

    test('orZero returns the integer when it is not null', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const int? nullableInt = 5;
      expect(nullableInt.orZero, equals(5));
    });

    test('or returns default value when integer is null', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const int? nullableInt = null;
      expect(nullableInt.or(defaultValue: 10), equals(10));
    });

    test('or returns the integer when it is not null', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const int? nullableInt = 5;
      expect(nullableInt.or(defaultValue: 10), equals(5));
    });

    test('or returns the integer in inner nullable class', () {
      final node = Node();
      final actual = node.value.or(defaultValue: 10);
      expect(actual, equals(10));
    });
  });

  group('NullableDoubleX extension', () {
    test('orZero returns zero when double is null', () {
      const double? nullableDouble = null;
      expect(nullableDouble.orZero, equals(0.0));
    });

    test('orZero returns the double when it is not null', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const double? nullableDouble = 5.5;
      expect(nullableDouble.orZero, equals(5.5));
    });

    test('or returns default value when double is null', () {
      const double? nullableDouble = null;
      expect(nullableDouble.or(defaultValue: 10.5), equals(10.5));
    });

    test('or returns the double when it is not null', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const double? nullableDouble = 5.5;
      expect(nullableDouble.or(defaultValue: 10.5), equals(5.5));
    });
  });

  group('NullableBoolX extension', () {
    test('orFalse returns false when boolean is null', () {
      const bool? nullableBool = null;
      expect(nullableBool.orFalse, isFalse);
    });

    test('orFalse returns the boolean when it is not null', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const bool? nullableBool = true;
      expect(nullableBool.orFalse, isTrue);
    });

    test('or returns default value when boolean is null', () {
      const bool? nullableBool = null;
      expect(nullableBool.or(defaultValue: true), isTrue);
    });

    test('or returns the boolean when it is not null', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const bool? nullableBool = false;
      expect(nullableBool.or(defaultValue: true), isFalse);
    });
  });

  group('LetX extension', () {
    test('run applies closure to non-null value', () {
      const nonNullInt = 1;
      final result = nonNullInt.run((item) => item * 2);
      expect(result, equals(2));
    });

    test('run applies closure to non-null string', () {
      const nonNullString = 'Hello';
      final result = nonNullString.run((item) => item.toUpperCase());
      expect(result, equals('HELLO'));
    });
  });

  group('AlsoX extension', () {
    test('also applies closure to value and returns the same value', () {
      var value = 1;
      final result = value.also((item) => value = item * 2);
      expect(result, equals(1));
      expect(value, equals(2));
    });

    test('also applies closure to string and returns the same string', () {
      var value = 'Hello';
      final result = value.also((item) => value = item.toUpperCase());
      expect(result, equals('Hello'));
      expect(value, equals('HELLO'));
    });
  });

  group('OrThrow Extension', () {
    test('should return the value if not null', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const String? name = 'John';
      expect(name.orThrow('Name cannot be null'), equals('John'));
    });

    test('should throw an exception if null', () {
      String? nullName;
      expect(() => nullName.orThrow('Name cannot be null'), throwsException);
    });

    test('should throw the correct exception message', () {
      String? nullName;
      expect(
        () => nullName.orThrow('Custom error message'),
        throwsA(
          predicate((e) => e.toString().contains('Custom error message')),
        ),
      );
    });
  });

  group('OrElseGet Extension', () {
    test('should return the value if not null', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const String? name = 'John';
      expect(name.orElseGet(() => 'Default Name'), equals('John'));
    });

    test('should return the computed value if null', () {
      String? nullName;
      expect(nullName.orElseGet(() => 'Default Name'), equals('Default Name'));
    });

    test('should call the supplier function only if null', () {
      // ignore: unnecessary_nullable_for_final_variable_declarations
      const String? name = 'John';
      bool wasCalled = false;

      name.orElseGet(() {
        wasCalled = true;
        return 'Default Name';
      });

      expect(wasCalled, isFalse);

      String? nullName;
      nullName.orElseGet(() {
        wasCalled = true;
        return 'Default Name';
      });

      expect(wasCalled, isTrue);
    });
  });
}

class CustomObject {
  final int val;

  CustomObject(this.val);
}
