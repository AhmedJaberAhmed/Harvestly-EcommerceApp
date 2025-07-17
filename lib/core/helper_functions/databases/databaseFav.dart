import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../../entities/product_Entity.dart';

class FavoriteDatabase {
  static final FavoriteDatabase instance = FavoriteDatabase._init();
  static Database? _database;

  FavoriteDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'favorites.db');

    _database = await openDatabase(
      path,
      version: 2,
      onCreate: _createDB,
    );
    return _database!;
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE favorites (
      code TEXT PRIMARY KEY,
      name TEXT,
      description TEXT,
      price REAL,
      numberOfCalories INTEGER,
      imageUrl TEXT
    )
  ''');
  }

  Future<void> addFavorite(FavoriteModel product) async {
    final db = await instance.database;
    await db.insert('favorites', product.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> removeFavorite(String code) async {
    final db = await instance.database;
    await db.delete('favorites', where: 'code = ?', whereArgs: [code]);
  }

  Future<List<FavoriteModel>> getFavorites() async {
    final db = await instance.database;
    final result = await db.query('favorites');
    return result.map((e) => FavoriteModel.fromMap(e)).toList();
  }

  Future<bool> isFavorite(String code) async {
    final db = await instance.database;
    final result =
    await db.query('favorites', where: 'code = ?', whereArgs: [code]);
    return result.isNotEmpty;
  }
}
