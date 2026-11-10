import 'package:drift/drift.dart';

class Affiliations extends Table {
  TextColumn get schoolId => text().withDefault(const Constant("1"))();
  TextColumn get schoolName => text()();
  TextColumn get schoolCode => text()();

  DateTimeColumn get updatedAt =>
      dateTime().clientDefault(() => DateTime.now())();

  @override
  Set<Column> get primaryKey => {schoolId};
}
