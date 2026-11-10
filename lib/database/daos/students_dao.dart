import 'package:attend_id/database/tables/students_table.dart';
import 'package:drift/drift.dart';

import '../app_database.dart';

part 'students_dao.g.dart';

// @DriftAccessor(tables: [Students])
// class StudentsDao extends DatabaseAccessor<AppDatabase>
//     with _$StudentsDaoMixin {
//   StudentsDao(super.db);

// }

// import 'package:drift/drift.dart';
// import '../database.dart';
// import '../tables/students.dart';

// part 'students_dao.g.dart';

@DriftAccessor(tables: [Students])
class StudentsDao extends DatabaseAccessor<AppDatabase>
    with _$StudentsDaoMixin {
  StudentsDao(super.db);

  // INSERT
  Future<void> insertStudent({
    required String displayName,
    required String regNumber,
  }) {
    return into(students).insert(
      StudentsCompanion.insert(displayName: displayName, regNumber: regNumber),
    );
  }

  // UPDATE
  Future<bool> updateStudent({
    required String studentId,
    required String displayName,
    required String regNumber,
  }) {
    return (update(students)..where((tbl) => tbl.studentId.equals(studentId)))
        .write(
          StudentsCompanion(
            displayName: Value(displayName),
            regNumber: Value(regNumber),
            updatedAt: Value(DateTime.now()),
            nextUpdateAt: Value(DateTime.now().add(const Duration(hours: 24))),
          ),
        )
        .then((rowsUpdated) => rowsUpdated > 0);
  }

  Future<void> saveStudent({
    required String displayName,
    required String regNumber,
  }) {
    return into(students).insertOnConflictUpdate(
      StudentsCompanion.insert(
        studentId: Value("1"),
        displayName: displayName,
        regNumber: regNumber,
        updatedAt: Value(DateTime.now()),
        nextUpdateAt: Value(DateTime.now().add(const Duration(hours: 24))),
      ),
    );
  }

  // WATCH ALL STUDENTS
  Stream<List<Student>> watchStudents() {
    return select(students).watch();
  }

  // // WATCH ONE STUDENT
  // Stream<Student?> watchStudent(String studentId) {
  //   return (select(
  //     students,
  //   )..where((tbl) => tbl.studentId.equals(studentId))).watchSingleOrNull();
  // }
}
