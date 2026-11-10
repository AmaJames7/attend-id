import 'package:attend_id/database/app_database.dart';
import 'package:attend_id/database/tables/affiliations_table.dart';
import 'package:drift/drift.dart';

part 'affiliations_dao.g.dart';

@DriftAccessor(tables: [Affiliations])
class AffiliationsDao extends DatabaseAccessor<AppDatabase>
    with _$AffiliationsDaoMixin {
  AffiliationsDao(super.db);

  Future<void> insertAffiliation({
    required String schoolName,
    required String schoolCode,
  }) {
    return into(affiliations).insert(
      AffiliationsCompanion.insert(
        schoolName: schoolName,
        schoolCode: schoolCode,
      ),
    );
  }

  // UPDATE
  Future<bool> updateAffiliation({
    required String schoolName,
    required String schoolCode,
  }) {
    return (update(affiliations)..where((tbl) => tbl.schoolId.equals("1")))
        .write(
          AffiliationsCompanion(
            schoolName: Value(schoolName),
            schoolCode: Value(schoolCode),
            updatedAt: Value(DateTime.now()),
          ),
        )
        .then((rowsUpdated) => rowsUpdated > 0);
  }

  Future<void> saveAffiliation({
    required String schoolName,
    required String schoolCode,
  }) {
    return into(affiliations).insertOnConflictUpdate(
      AffiliationsCompanion.insert(
        schoolId: Value("1"),
        schoolName: schoolName,
        schoolCode: schoolCode,
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Stream<List<Affiliation>> watchAffiliations() {
    return select(affiliations).watch();
  }

  Future<int> deleteAffiliation({required String schoolName}) {
    return (delete(
      affiliations,
    )..where((tbl) => tbl.schoolId.equals("1"))).go();
    // .delete(
    //   AffiliationsCompanion(
    //     schoolName: Value(schoolName),
    //     updatedAt: Value(DateTime.now()),
    //   ),
    // )
    // .then((rowsUpdated) => rowsUpdated > 0);
  }
}
