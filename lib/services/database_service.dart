import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/order_model.dart';

class DatabaseService {
  static Database? _db;

  static Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDB();
    return _db!;
  }

  static Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'orders.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE orders(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            billSerial TEXT,
            billDate TEXT,
            billAmount TEXT,
            status TEXT
          )
        ''');
      },
    );
  }

  // Add order
  static Future<void> insertOrder(OrderModel order) async {
    final db = await database;
    await db.insert(
      'orders',
      order.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Delete order
  static Future<void> clearOrders() async {
    final db = await database;
    await db.delete('orders');
  }

  // Get order
  static Future<List<OrderModel>> getOrders() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('orders');

    return List.generate(maps.length, (i) {
      return OrderModel(
        billSerial: maps[i]['billSerial'],
        billDate: maps[i]['billDate'],
        billAmount: maps[i]['billAmount'],
        status: maps[i]['status'],
      );
    });
  }
}
