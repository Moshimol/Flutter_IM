
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
}