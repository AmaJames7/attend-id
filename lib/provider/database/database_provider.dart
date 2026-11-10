import 'package:attend_id/database/app_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Global provider declaration
final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
});
