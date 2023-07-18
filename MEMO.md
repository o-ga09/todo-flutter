# LEARNED

## Future　について

## sqlfliteの使い方

~~~bash

Error: Bad state: databaseFactory not initialized
databaseFactory is only initialized when using sqflite. When using `sqflite_common_ffi`
You must call `databaseFactory = databaseFactoryFfi;` before using global openDatabase API

~~~


https://stackoverflow.com/questions/55424575/bad-state-mock-method-was-not-called-within-when-was-a-real-method-called

２つならべることできない
      when(inputMock.getAll()).thenAnswer((_) => Future.value(expected));
      when(outputMock.display(any));
