// Mocks generated by Mockito 5.4.2 from annotations
// in todo_app/test/usecase/usecase_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:mockito/mockito.dart' as _i1;
import 'package:todo_app/domain/entity.dart' as _i2;
import 'package:todo_app/usecase/port/todoinputport.dart' as _i4;
import 'package:todo_app/usecase/port/todooutputport.dart' as _i6;
import 'package:todo_app/usecase/toodousecase.dart' as _i3;

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

class _FakeTask_0 extends _i1.SmartFake implements _i2.Task {
  _FakeTask_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeErrorMsg_1 extends _i1.SmartFake implements _i3.ErrorMsg {
  _FakeErrorMsg_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [TodoInPutPort].
///
/// See the documentation for Mockito's code generation for more information.
class MockTodoInPutPort extends _i1.Mock implements _i4.TodoInPutPort {
  @override
  _i5.Future<List<_i2.Task>> getAll() => (super.noSuchMethod(
        Invocation.method(
          #getAll,
          [],
        ),
        returnValue: _i5.Future<List<_i2.Task>>.value(<_i2.Task>[]),
        returnValueForMissingStub:
            _i5.Future<List<_i2.Task>>.value(<_i2.Task>[]),
      ) as _i5.Future<List<_i2.Task>>);
  @override
  _i5.Future<_i2.Task> getById(int? id) => (super.noSuchMethod(
        Invocation.method(
          #getById,
          [id],
        ),
        returnValue: _i5.Future<_i2.Task>.value(_FakeTask_0(
          this,
          Invocation.method(
            #getById,
            [id],
          ),
        )),
        returnValueForMissingStub: _i5.Future<_i2.Task>.value(_FakeTask_0(
          this,
          Invocation.method(
            #getById,
            [id],
          ),
        )),
      ) as _i5.Future<_i2.Task>);
  @override
  _i5.Future<_i3.ErrorMsg> create(_i2.EditTask? data) => (super.noSuchMethod(
        Invocation.method(
          #create,
          [data],
        ),
        returnValue: _i5.Future<_i3.ErrorMsg>.value(_FakeErrorMsg_1(
          this,
          Invocation.method(
            #create,
            [data],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.ErrorMsg>.value(_FakeErrorMsg_1(
          this,
          Invocation.method(
            #create,
            [data],
          ),
        )),
      ) as _i5.Future<_i3.ErrorMsg>);
  @override
  _i5.Future<_i3.ErrorMsg> update(
    int? id,
    _i2.EditTask? data,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #update,
          [
            id,
            data,
          ],
        ),
        returnValue: _i5.Future<_i3.ErrorMsg>.value(_FakeErrorMsg_1(
          this,
          Invocation.method(
            #update,
            [
              id,
              data,
            ],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.ErrorMsg>.value(_FakeErrorMsg_1(
          this,
          Invocation.method(
            #update,
            [
              id,
              data,
            ],
          ),
        )),
      ) as _i5.Future<_i3.ErrorMsg>);
  @override
  _i5.Future<_i3.ErrorMsg> delete(int? id) => (super.noSuchMethod(
        Invocation.method(
          #delete,
          [id],
        ),
        returnValue: _i5.Future<_i3.ErrorMsg>.value(_FakeErrorMsg_1(
          this,
          Invocation.method(
            #delete,
            [id],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.ErrorMsg>.value(_FakeErrorMsg_1(
          this,
          Invocation.method(
            #delete,
            [id],
          ),
        )),
      ) as _i5.Future<_i3.ErrorMsg>);
}

/// A class which mocks [TodoOutPutPort].
///
/// See the documentation for Mockito's code generation for more information.
class MockTodoOutPutPort extends _i1.Mock implements _i6.TodoOutPutPort {
  @override
  _i5.Future<void> display(List<_i2.Task>? tasks) => (super.noSuchMethod(
        Invocation.method(
          #display,
          [tasks],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
}
