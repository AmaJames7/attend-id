import 'package:drift/drift.dart';
// import 'package:uuid/uuid.dart';

class Students extends Table {
  TextColumn get studentId => text().withDefault(const Constant("1"))();

  TextColumn get displayName => text()();

  TextColumn get regNumber => text()();

  DateTimeColumn get updatedAt =>
      dateTime().clientDefault(() => DateTime.now())();

  DateTimeColumn get nextUpdateAt =>
      dateTime().clientDefault(() => DateTime.now().add(Duration(hours: 24)))();

  @override
  Set<Column> get primaryKey => {studentId};
}
