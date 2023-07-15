import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/driver/tododriver.dart';
import 'package:todo_app/gateway/todogateway.dart';
import 'package:todo_app/presenter/todopresenter.dart';
import 'package:todo_app/state/todostate.dart';
import 'package:todo_app/usecase/toodousecase.dart';

void main() async {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

final todoStateProvider = ChangeNotifierProvider((ref) {
  return TodoState();
});

// ignore: must_be_immutable
class MyHomePage extends ConsumerWidget {
  MyHomePage({Key?  key}) : super(key: key);

  int turn = 0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoState = ref.watch(todoStateProvider);
    final driver = TodoDriverImpl();
    final presenter = TodoPresenterImpl(todoState);
    final gateway = TodoGateway(driver);
    final usecase = TodoUsecase(gateway,presenter);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Todo App'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                DataTable(
                  columns: const <DataColumn>[
                    DataColumn(label: Text('Column 1')),
                    DataColumn(label: Text('Column 2')),
                    DataColumn(label: Text('Column 3')),
                  ],
                  rows: List<DataRow>.generate(
                    todoState.tasks.length, // 表示する行数
                    (index) => DataRow(
                      cells: <DataCell>[
                        DataCell(Text(todoState.tasks[index].taskId.value.toString())),
                        DataCell(Text(todoState.tasks[index].taskDesc.value)),
                        DataCell(Text(todoState.tasks[index].createdAt.value.toIso8601String())),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            final now = DateTime.now();
            usecase.create(RequestData("hoge", "desc 1", now.toIso8601String(), now.toIso8601String()));
            usecase.getAll();
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}


class FormWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Name',
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Email',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // フォーム送信の処理
              print('Form Submitted');
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}