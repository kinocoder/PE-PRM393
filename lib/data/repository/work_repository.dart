import '../local/database_helper.dart';
import '../model/work.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'work_repository.g.dart';

@riverpod
WorkRepository workRepository(Ref ref){
  return WorkRepository(DatabaseHelper());
}

class WorkRepository  {
  final DatabaseHelper _databaseHelper;

  WorkRepository(this._databaseHelper);

  //Lấy toàn bộ work
  Future<List<Work>> getWorks() async {
    final db = await _databaseHelper.openWorkDatabase();
    final List<Map<String, dynamic>> maps = await db.query('works');

    return maps.map((map) => Work.fromMap(map)).toList();
  }

  //Update work
  Future<int> updateWork(Work work) async {
    final db = await _databaseHelper.openWorkDatabase();
    return await db.update(
      'works',
      work.toMap(),
      where: 'workId = ?',
      whereArgs: [],
    );
  }
}
