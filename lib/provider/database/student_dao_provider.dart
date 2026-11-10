// Global provider declaration

import 'package:attend_id/database/daos/students_dao.dart';
import 'package:attend_id/provider/database/database_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final studentsDaoProvider = Provider<StudentsDao>((ref) {
  return ref.watch(databaseProvider).studentsDao;
});
