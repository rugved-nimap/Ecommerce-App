import 'package:ecommerce/models/sqf_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  DatabaseService.constructor();

  static final DatabaseService instance = DatabaseService.constructor();

  Database? _db1;
  Database? _db2;

  final String _databaseName = "ecommerce";
  final String shoppingTableName = "shopping_table";
  final String wishListTableName = "wishlist_table";
  final String _columnProductIdTableName = "id";
  final String _columnTimeStampTableName = "timeStamp";

  Future<Database> get database1 async {
    if (_db1 != null) return _db1!;
    _db1 = await getDatabase(
      shoppingTableName,
      _columnProductIdTableName,
      _columnTimeStampTableName,
    );
    return _db1!;
  }

  Future<Database> get database2 async {
    if (_db2 != null) return _db2!;
    _db2 = await getDatabase(
      wishListTableName,
      _columnProductIdTableName,
      _columnTimeStampTableName,
    );
    return _db2!;
  }

  Future<Database> getDatabase(
    String tableName,
    String column1Name,
    String column2name,
  ) async {
    final databaseDirPath = await getDatabasesPath();
    final databasePath = join(databaseDirPath, _databaseName);

    final database = await openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE $tableName (
            $column1Name INTEGER NOT NULL,
            $column2name INTEGER NOT NULL,
          )
        ''');
      },
    );

    return database;
  }

  Future<List<SqfModel>> getList(
      Future<Database> database, String tableName) async {
    final db = await database;
    final data = await db.query(
      tableName,
      orderBy: '$_columnTimeStampTableName ASC',
    );
    List<SqfModel> list = data
        .map((e) => SqfModel(
              id: e[_columnProductIdTableName] as int,
              timestamp: e[_columnTimeStampTableName] as int,
            ))
        .toList();

    return list;
  }

  void addProductToDatabase(
    Future<Database> database,
    String tableName,
    int id,
  ) async {
    final db = await database;
    await db.insert(tableName, {
      _columnProductIdTableName: id,
      _columnTimeStampTableName: DateTime.now().millisecondsSinceEpoch,
    });
  }

  void deleteProductFromDatabase(
    Future<Database> database,
    String tableName,
    int id,
  ) async {
    final db = await database;
    await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }
}
