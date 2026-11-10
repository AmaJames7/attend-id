import 'package:attend_id/database/app_database.dart';
import 'package:attend_id/provider/database/student_dao_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final studentListProvider = StreamProvider.autoDispose
    .family<List<Student>, String>((ref, id) {
      return ref.read(studentsDaoProvider).watchStudents();
    });
