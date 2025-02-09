import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class SqlDB {
  static Database? _database;

  Future<Database?> get db async{
    if(_database == null){
      _database = await initialDataBase();
      return _database;
    }else{
      return _database;
    }
  }
  initialDataBase() async{
    String dbPath = await getDatabasesPath();
    String path = join(dbPath,"file.db");
    Database mDB = await openDatabase(
      path,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
      version: 1,
    );
    return mDB;
  }
  _onCreate(Database d,int version) async {
    await d.execute('''
      create table "notes" (
        "id" integer not null primary key autoincrement,
        "title" text not null,
        "note" text
      )
    ''');
    print("on create ================");
  }
  _onUpgrade(Database d,int oldVersion, int newVersion) async {
    print("on Upgrade =============");
  }
  insertData(String sql,List<dynamic> arguments) async {
    Database? myDB = await db;
    int response = await myDB!.rawInsert(sql,arguments);
    return response;
  }
  updateData(String sql) async {
    Database? myDB = await db;
    int response = await myDB!.rawUpdate(sql);
    return response;
  }
  readData(String sql) async {
    Database? myDB = await db;
    List<Map> response = await myDB!.rawQuery(sql);
    return response;
  }
  deleteData(String sql) async {
    Database? myDB = await db;
    int response = await myDB!.rawDelete(sql);
    return response;
  }
  deleteDataBase() async{
    String dbp = await getDatabasesPath();
    String path = join(dbp,"file.db");
    if(_database != null){
      await _database!.close();
      _database = null;
    }
    await deleteDatabase(path);
  }
}