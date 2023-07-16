import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/park.dart';

//주차장 위치정보를 저장할 테이블명
final String tableName = 'parks';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();

  factory DBHelper() {
    return _instance;
  }

  DBHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final database = openDatabase(
// 데이터베이스 경로를 지정합니다.
        join(await getDatabasesPath(), 'parks.db'),
        onCreate: (db, version) async {
      await db.execute(
//parks 테이블은 주차장코드를 key로 가지며 주차장명, 위도, 경도를 가지고 있습니다.
        "CREATE TABLE $tableName(parking_code TEXT PRIMARY KEY, parking_name TEXT, lat REAL, lng REAL)",
      );
    }, version: 1);
    return database;
  }

//주차장정보를 테이블에 등록합니다
//park 클래스를 인자로 받아 해당 정보를 등록합니다.
  Future<void> insertPark(Park park) async {
    final db = await database;

    await db.insert(
      tableName,
      park.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace
    );
  }

//주차장정보를 조회합니다.
//주차장코드를 인자로 받아 테이블에서 코드에 해당하는 주차장정보를 가져옵니다.(단건조회)
  Future<Park> getPark(int parking_code) async {
    final db = await database;

    List<Map<String, dynamic>> maps = await db.query(tableName,
        columns: ["parking_code", "parking_name", "lat", "lng"],
        where: "parking_code = ?",
        whereArgs: [parking_code]);

    return Park.fromJson(maps.first);
  }

//주차장정보를 조회합니다.
//park테이블 내 전체 주차장정보를 조회해 리턴합니다.(다건조회)
  Future<List<Park>> parks() async {
    final db = await database;

// 모든 parks를 얻기 위해 테이블에 질의합니다.
    final List<Map<String, dynamic>> maps = await db.query('parks');

// List<Map<String, dynamic>를 List<Park>으로 변환합니다.
    return List.generate(maps.length, (i) {
      return Park(
        parking_code: maps[i]['parking_code'],
        parking_name: maps[i]['parking_name'],
        lat: maps[i]['lat'],
        lng: maps[i]['lng'],
      );
    });
  }

//주차장정보를 수정합니다.
  Future<void> updatePark(Park park) async {
    final db = await database;

// 주어진 park를 수정합니다.
    await db.update(
      tableName,
      park.toJson(),
// Park의 id가 일치하는 지 확인합니다.
      where: "parking_code = ?",
// Park의 parking_code를 whereArg로 넘겨 SQL injection을 방지합니다.
      whereArgs: [park.parking_code],
    );
  }

//주차장정보를 삭제합니다.
  Future<void> deletePark(int parkingCode) async {
    final db = await database;

// 데이터베이스에서 park를 삭제합니다.
    await db.delete(
      tableName,
// 특정 Park를 제거하기 위해 `where` 절을 사용하세요
      where: "parking_code = ?",
// Park의 parking_code를 where의 인자로 넘겨 SQL injection을 방지합니다.
      whereArgs: [parkingCode],
    );
  }

//parks 테이블을 truncate 합니다.
  Future<void> truncateParks() async {
    final db = await database;

//테이블에서 모든 Park를 삭제합니다.
    await db.rawDelete('DELETE FROM $tableName');
  }
}
