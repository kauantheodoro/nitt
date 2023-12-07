import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class DB{
  //CONSTRUTOR COM ACESSO PRIVADO
  DB._();
  //CRIAR UMA INSTANCIA DE DB
  static final DB instance = DB._();
  //Instancia do SQLite
  static Database? _database;

  get database async{
    if(_database != null) return _database;
    return await _initDatabase();
  }
  _initDatabase() async{
    return await openDatabase(
      join(await getDatabasesPath(),'nitt.db'),
      version: 1,
      onCreate: _onCreate,
    );
  }
  _onCreate(db,versao) async{
    await db.execute(_metas);
  }

  String get _metas => '''
    CREATE TABLE Metas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    prioridade VARCHAR(255) NOT NULL,
    descricao TEXT NOT NULL,
    prazo VARCHAR(50) NOT NULL
);
  ''';
}