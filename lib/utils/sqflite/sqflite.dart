
// 数据库问题
import 'package:sqflite/sqflite.dart';

class SqlLite {

  static SqlLite instance = SqlLite._internal();
  factory SqlLite() => instance;

  SqlLite._internal() {
    print("sql internal");
  }

  Future<void> initWithChatId(String chatId) async {
    var db = await openDatabase("sql/chat_db_${chatId}.db");
    print(db);
  }

  // 创建用户表
  static createUserTable(){
    String userSql = 'CREATE TABLE IF NOT EXISTS user_table (id INTEGER PRIMARY KEY, name TEXT,age INTEGER)';
    //_createDb(dbName, version, dbTables)
  }


  static _createDb(String dbName, int version, String dbTables) async {

  }

}