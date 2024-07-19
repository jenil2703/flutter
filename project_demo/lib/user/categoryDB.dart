import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'categoryDBmodel.dart';


class DB {
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    return openDatabase(join(path, "tops.db"),
        onCreate: (database, version) async {
          await database.execute(
              'CREATE TABLE CategoryDownload(id INTEGER PRIMARY KEY AUTOINCREMENT,url TEXT NOT NULL)');
        }, version: 1);
  }

  Future<bool> insertData(Model1 categoryModel) async {
    final Database db = await initDB();
    db.insert("CategoryDownload", categoryModel.toMap());
    return true;
  }

  Future<List<Model1>> getData() async {
    final Database db = await initDB();
    final List<Map<String, Object?>> data = await db.query("CategoryDownload");
    return data.map((e) => Model1.formMap(e)).toList();
  }

  Future<void> deleteData(int id) async {
    final Database db = await initDB();
    await db.delete("CategoryDownload", where: "id=?", whereArgs: [id]);
  }
}
