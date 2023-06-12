// 数据库问题
import 'package:sqflite/sqflite.dart';

// 数据库版本
const sqlVersion = 1;

class SqlLite {
  static SqlLite instance = SqlLite._internal();

  factory SqlLite() => instance;

  String sqlDbName = "";

  SqlLite._internal() {
    print("sql internal");
  }

  Future<void> initWithChatId(String chatId) async {
    var sqlDbName = "sql/chat_db_${chatId}.db";
    SqlLite().sqlDbName = sqlDbName;
    var db = await openDatabase(sqlDbName);
    print(db);
    createUserTable();
  }

  // 创建用户表
  static createUserTable() {
    String userSql =
        "CREATE TABLE IF NOT EXISTS user_table (id INT PRIMARY KEY AUTO_INCREMENT,chat_id INTEGER PRIMARY KEY,account_id VARCHAR(250),name VARCHAR(50)avatar VARCHAR(255) NOT NULL,gender INTEGER NOT NULL,nickname VARCHAR(255),user_type VARCHAR(255),appkey VARCHAR(255),sub_org_key VARCHAR(255),sub_org_name VARCHAR(255),job_title VARCHAR(255),is_block VARCHAR(255),);";
    _createDb(SqlLite().sqlDbName, sqlVersion, userSql);
  }

  static _createDb(String dbName, int version, String dbTables) async {
    var databasesPath = await getDatabasesPath();
    String path = databasesPath + dbName;
    print("数据库路径：$path 数据库版本$version");
    //打开数据库
    await openDatabase(
        path,
        version:version,
        onUpgrade: (Database db, int oldVersion, int newVersion) async{
          //数据库升级,只回调一次
          print("数据库需要升级！旧版：$oldVersion,新版：$newVersion");
        },
        onCreate: (Database db, int vers) async{
          //创建表，只回调一次
          await db.execute(dbTables);
          await db.close();
        }
    );
  }
}
