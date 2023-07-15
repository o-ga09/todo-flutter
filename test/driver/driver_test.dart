import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/driver/tododriver.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart'; // 追加

void main() {
  group("ドライバーのテスト", () {
    test("DBからタスクの一覧を取得する", () async {
      TestWidgetsFlutterBinding.ensureInitialized();
      sqfliteFfiInit(); // 追加
      databaseFactory = databaseFactoryFfi; // 追加
      final driver = TodoDriverImpl();
      final actual = await driver.getAll();
      List<DriverTask> expected = [];
      
      expect(actual, expected);
    });

    test("DBから任意のタスクを取得する", () async {
      TestWidgetsFlutterBinding.ensureInitialized();
      sqfliteFfiInit(); // 追加
      databaseFactory = databaseFactoryFfi; // 追加
      final driver = TodoDriverImpl();
      final actual = await driver.getById(1);
      DriverTask expected = DriverTask(-1, "", "", DateTime(9999, 9, 99), DateTime(9999, 9, 99));
      
      expect(actual.id, expected.id);
      expect(actual.taskName, expected.taskName);
      expect(actual.taskDesc, expected.taskDesc);
      expect(actual.createdAt, expected.createdAt);
      expect(actual.updatedAt, expected.updatedAt);
    });

    test("DBにタスクを登録する", () async {
      TestWidgetsFlutterBinding.ensureInitialized();
      sqfliteFfiInit(); // 追加
      databaseFactory = databaseFactoryFfi; // 追加
      final now = DateTime.now();
      final arg = DriverEdit("", "", now, now);
      final driver = TodoDriverImpl();
      final actual = await driver.create(arg);
      DriverMsg expected = DriverMsg(1);
      
      expect(actual.errno, expected.errno);
    });

    test("DBから任意のスクを編集する", () async {
      TestWidgetsFlutterBinding.ensureInitialized();
      sqfliteFfiInit(); // 追加
      databaseFactory = databaseFactoryFfi; // 追加
      final driver = TodoDriverImpl();
      final now = DateTime.now();
      final arg = DriverEdit("", "", now, now);
      final actual = await driver.update(1,arg);
      final expected = DriverMsg(0);
      
      expect(actual.errno, expected.errno);
    });

    test("DBから任意のタスクを削除する", () async {
      TestWidgetsFlutterBinding.ensureInitialized();
      sqfliteFfiInit(); // 追加
      databaseFactory = databaseFactoryFfi; // 追加
      final driver = TodoDriverImpl();
      final actual = await driver.delete(1);
      final expected = DriverMsg(0);
      
      expect(actual.errno, expected.errno);
    });
   });
}