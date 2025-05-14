// import 'dart:async';
// import 'dart:io';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';

// import 'users.dart';

// class DatabaseHelper {
//   static final DatabaseHelper _instance = DatabaseHelper._internal();

//   factory DatabaseHelper() => _instance;

//   DatabaseHelper._internal();

//   late Database _database;

//   Future<Database> get database async {
//     if (_database != null) {
//       return _database;
//     }
//     _database = await initDatabase();
//     return _database;
//   }

//   Future<Database> initDatabase() async {
//     Directory documentsDirectory = await getApplicationDocumentsDirectory();
//     String path = join(documentsDirectory.path, 'db_itmaen.db');
//     return await openDatabase(
//       path,
//       version: 1,
//       onCreate: _createModels,
//     );
//   }

//   Future<void> _createModels(Database db, int version) async {

//     await db.execute('''
//       CREATE TABLE Counters (
//         id INTEGER PRIMARY KEY AUTOINCREMENT,
//         staff_ids_counter INTEGER,
//         patient_ids_counter INTEGER,
//       )
//     ''');

//     await db.execute('''
//       CREATE TABLE Users (
//         id INTEGER PRIMARY KEY AUTOINCREMENT,
//         staff_id INTEGER,
//         patient_id INTEGER,
//         username TEXT,
//         email TEXT,
//         password TEXT,
//         f_name TEXT,
//         l_name TEXT,
//         medical_staff_type TEXT,
//         medical_staff_major TEXT,
//         patient_login_id TEXT,
//         secure_code_login TEXT,
//         hospital TEXT,
//         department TEXT,
//         user_role TEXT,
//         created_at TEXT,
//         StatusConversationID INTEGER,
//         ConversationChatID INTEGER,
//         MedicalRecordID INTEGER,
//         isRemoved BOOL
//       )
//     ''');
  
  
  
  
//   }

//   Future<int> insertUser(Users user) async {
//     final db = await database;
//     return await db.insert('Users', user.toMap());
//   }

//     Future<int> initialCounter() async {
//     final db = await database;
//     return await db.insert('Counters', {'staff_ids_counter':0, 'patient_ids_counter':0});
//   }

//   Future<int> incrementCounterPatient() async {
//     final db = await database;

//     Future<List<Map<String, Object?>>> result = db.query('Counters', where: 'id = ?', whereArgs: [0]);

//   for (Map<String, Object?> result in result){

//         return await db.update(
//         'Counters',
//         {'staff_ids_counter':result['staff_ids_counter'], 'patient_ids_counter':int(result['patient_ids_counter']) + 1},
//         where: 'id = ?',
//         whereArgs: [0], // Provide the ID of the user you want to update
//       );

//   }


//     return await db.insert('Counters', {'staff_ids_counter':0, 'patient_ids_counter':0});
//   }

// }
