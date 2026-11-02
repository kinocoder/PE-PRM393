import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'package:flutter/services.dart';

class DatabaseHelper {
  Future<Database> openWorkDatabase() async {
    // Bước 1: Lấy đường dẫn database
    final dbPath = await getDatabasesPath();

    // Bước 2: Tạo đường dẫn file
    final path = join(dbPath, 'works.db');

    // Bước 3: Kiểm tra database đã tồn tại chưa
    if (!await databaseExists(path)) {

      // Bước 4: Đọc file từ assets
      final data = await rootBundle.load(
        'assets/database/work.db',
      );

      // Bước 5: Copy file vào thư mục database
      final bytes = data.buffer.asUint8List(
        data.offsetInBytes,
        data.lengthInBytes,
      );

      await Directory(dirname(path)).create(
        recursive: true,
      );

      await File(path).writeAsBytes(
        bytes,
        flush: true,
      );
    }

    // Bước 6: Mở database
    return await openDatabase(path);
  }
}
