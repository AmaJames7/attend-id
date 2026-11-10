import 'package:attend_id/database/daos/affiliations_dao.dart';
import 'package:attend_id/database/daos/students_dao.dart';
import 'package:attend_id/database/tables/affiliations_table.dart';
import 'package:attend_id/database/tables/students_table.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [Students, Affiliations],
  daos: [StudentsDao, AffiliationsDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  // Future<void> initialize() async {
  //   // await settingsDao.initialize();
  // }

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'attend_id_db',
      native: const DriftNativeOptions(
        // By default, `driftDatabase` from `package:drift_flutter` stores the
        // database files in `getApplicationDocumentsDirectory()`.
        databaseDirectory: getApplicationSupportDirectory,
      ),
      // If you need web support, see https://drift.simonbinder.eu/platforms/web/
    );
  }
}
