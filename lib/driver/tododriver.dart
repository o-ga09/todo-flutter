import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

abstract class TodoDriver {
  Future<List<DriverTask>> getAll();
  Future<DriverTask> getById(int id);
  Future<DriverMsg> create(DriverEdit data);
  Future<DriverMsg> update(int id, DriverEdit data);
  Future<DriverMsg> delete(int id);
}


class TodoDriverImpl implements TodoDriver {
  Future<Database> openDB() async {
    // データベースファイルが存在する場合は削除
    // デバッグ用
    final databasePath = join(await getDatabasesPath(), 'tasks.db');
    await deleteDatabase(databasePath);

    return await openDatabase(
      databasePath,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE tasks (id INTEGER PRIMARY KEY, name TEXT, desc TEXT, created_at TEXT, updated_at TEXT)',
        );
      },
      version: 1,
    );
  }

  @override
  Future<List<DriverTask>> getAll() async {
    final Database db = await openDB();
    final List<Map<String, dynamic>> res = await db.query('tasks');
    
    return List.generate(res.length, (i) {
      return DriverTask(
        res[i]['id'],
        res[i]['name'],
        res[i]['desc'],
        res[i]['created_at'],
        res[i]['updated_at']
      );
    });
  }
  
  @override
  Future<DriverMsg> create(DriverEdit data) async {
    final Database db = await openDB();
    final res = await db.insert('tasks', data.toMap());
    return DriverMsg(res);
  }
  
  @override
  Future<DriverMsg> delete(int id) async {
    final Database db = await openDB();
    final res = await db.delete(
      'tasks',
      where: 'id = ?',
      whereArgs: [id],
    );

    return DriverMsg(res);
  }
  
  @override
  Future<DriverTask> getById(int id) async {
    final Database db = await openDB();
    final List<Map<String, dynamic>> res = await db.query(
      'tasks',
      where: 'id = ?',
      whereArgs: [id],
    );

    if(res.length == 0) {
      return DriverTask(-1, "", "", DateTime(9999, 9, 99), DateTime(9999, 9, 99));
    }

    return DriverTask(res.first['id'], res.first['name'], res.first['desc'], res.first['created_at'], res.first['updated_at']);
  }
  
  @override
  Future<DriverMsg> update(int id, DriverEdit data) async {
    final Database db = await openDB();
    final  res = await db.update(
      'tasks', 
      data.toMap(),
      where: 'id = ?',
      whereArgs: [id],
    );

    return DriverMsg(res);
  }
}


class DriverTask { 
  final int id;
  final String taskName;
  final String taskDesc;
  final DateTime createdAt;
  final DateTime updatedAt;

  DriverTask(this.id, this.taskName, this.taskDesc, this.createdAt, this.updatedAt);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': taskName,
      'desc': taskDesc,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}

class DriverMsg { 
  final int errno;

  DriverMsg(this.errno);
}

class DriverEdit {
  final String taskName;
  final String taskDesc;
  final DateTime createdAt;
  final DateTime updatedAt;

  DriverEdit(this.taskName, this.taskDesc, this.createdAt, this.updatedAt);
  Map<String, dynamic> toMap() {
    return {
      'name': taskName,
      'desc': taskDesc,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}