import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../domain/model/comparison_data.dart';
import '../mapper/comparison_data_db_mapper.dart';

@LazySingleton()
class LocalComparisonDataStorageService {
  static const String _tableName = 'comparison_data_cache';
  static const int _cacheTTL = 2 * 60 * 60 * 1000;

  Future<Database> _getDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'comparison_data_cache.db');

    return openDatabase(path, version: 1, onCreate: (db, version) {
      return db.execute('''
        CREATE TABLE $_tableName (
          pairCode TEXT,
          date INTEGER,
          bid REAL,
          ask REAL,
          high REAL,
          low REAL,
          pctChange REAL,
          PRIMARY KEY(pairCode, date)
        )
        ''');
      },
    );
  }

  Future<List<ComparisonData>> getComparisonData(String pairCode) async {
    final db = await _getDatabase();

    final result = await db.query(
      _tableName,
      where: 'pairCode = ?',
      whereArgs: [pairCode],
    );

    return result.map((e) => ComparisonDataDbMapper.fromMap(e)).toList();
  }

  Future<void> saveComparisonData(String pairCode, List<ComparisonData> list) async {
    final db = await _getDatabase();
    final batch = db.batch();

    for (final data in list) {
      batch.insert(
        _tableName,
        data.toMap(pairCode),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    await batch.commit(noResult: true);
  }
}