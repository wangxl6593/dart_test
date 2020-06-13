// import 'package:dart_test/dart_test.dart' as dart_test;
// import 'dart:io';
import 'package:mysql1/mysql1.dart';

int flag = 1;

void main() {
   void query() async {
    // Open a connection (testdb should already exist)
    final conn = await MySqlConnection.connect(ConnectionSettings(
            user: 'root',
            host: 'localhost',
            port: 3306,
            password: 'LA.6593B',
            db: 'flutter'))
        .catchError((onError) {
      print(onError);
    });
    var results = await conn.query('select * from board');
    for (var row in results) {
      print('$row');
    }
  }
  query();

}
