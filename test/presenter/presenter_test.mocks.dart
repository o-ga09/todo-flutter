// Mocks generated by Mockito 5.4.2 from annotations
// in todo_app/test/presenter/presenter_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:ui' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:todo_app/domain/entity.dart' as _i3;
import 'package:todo_app/state/todostate.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [TodoState].
///
/// See the documentation for Mockito's code generation for more information.
class MockTodoState extends _i1.Mock implements _i2.TodoState {
  @override
  List<_i3.Task> get tasks => (super.noSuchMethod(
        Invocation.getter(#tasks),
        returnValue: <_i3.Task>[],
        returnValueForMissingStub: <_i3.Task>[],
      ) as List<_i3.Task>);
  @override
  set tasks(List<_i3.Task>? _tasks) => super.noSuchMethod(
        Invocation.setter(
          #tasks,
          _tasks,
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);
  @override
  void setTask(List<_i3.Task>? t) => super.noSuchMethod(
        Invocation.method(
          #setTask,
          [t],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void addListener(_i4.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void removeListener(_i4.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}