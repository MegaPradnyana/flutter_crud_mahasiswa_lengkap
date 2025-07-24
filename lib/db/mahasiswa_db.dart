import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../model/mahasiswa.dart';

class MahasiswaDB {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  static Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'mahasiswa.db');
    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE mahasiswa(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          nama TEXT,
          nim TEXT,
          jurusan TEXT
        )
      ''');
    });
  }

  static Future<List<Mahasiswa>> getAllMahasiswa() async {
    final db = await database;
    final data = await db.query('mahasiswa', orderBy: 'id DESC');
    return data.map((e) => Mahasiswa.fromMap(e)).toList();
  }

  static Future<void> insertMahasiswa(Mahasiswa mhs) async {
    final db = await database;
    await db.insert('mahasiswa', mhs.toMap());
  }

  static Future<void> updateMahasiswa(Mahasiswa mhs) async {
    final db = await database;
    await db.update('mahasiswa', mhs.toMap(), where: 'id = ?', whereArgs: [mhs.id]);
  }

  static Future<void> deleteMahasiswa(int id) async {
    final db = await database;
    await db.delete('mahasiswa', where: 'id = ?', whereArgs: [id]);
  }
}