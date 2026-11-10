// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $StudentsTable extends Students with TableInfo<$StudentsTable, Student> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StudentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _studentIdMeta = const VerificationMeta(
    'studentId',
  );
  @override
  late final GeneratedColumn<String> studentId = GeneratedColumn<String>(
    'student_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant("1"),
  );
  static const VerificationMeta _displayNameMeta = const VerificationMeta(
    'displayName',
  );
  @override
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
    'display_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _regNumberMeta = const VerificationMeta(
    'regNumber',
  );
  @override
  late final GeneratedColumn<String> regNumber = GeneratedColumn<String>(
    'reg_number',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  static const VerificationMeta _nextUpdateAtMeta = const VerificationMeta(
    'nextUpdateAt',
  );
  @override
  late final GeneratedColumn<DateTime> nextUpdateAt = GeneratedColumn<DateTime>(
    'next_update_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now().add(Duration(hours: 24)),
  );
  @override
  List<GeneratedColumn> get $columns => [
    studentId,
    displayName,
    regNumber,
    updatedAt,
    nextUpdateAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'students';
  @override
  VerificationContext validateIntegrity(
    Insertable<Student> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('student_id')) {
      context.handle(
        _studentIdMeta,
        studentId.isAcceptableOrUnknown(data['student_id']!, _studentIdMeta),
      );
    }
    if (data.containsKey('display_name')) {
      context.handle(
        _displayNameMeta,
        displayName.isAcceptableOrUnknown(
          data['display_name']!,
          _displayNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_displayNameMeta);
    }
    if (data.containsKey('reg_number')) {
      context.handle(
        _regNumberMeta,
        regNumber.isAcceptableOrUnknown(data['reg_number']!, _regNumberMeta),
      );
    } else if (isInserting) {
      context.missing(_regNumberMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('next_update_at')) {
      context.handle(
        _nextUpdateAtMeta,
        nextUpdateAt.isAcceptableOrUnknown(
          data['next_update_at']!,
          _nextUpdateAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {studentId};
  @override
  Student map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Student(
      studentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}student_id'],
      )!,
      displayName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}display_name'],
      )!,
      regNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reg_number'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      nextUpdateAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}next_update_at'],
      )!,
    );
  }

  @override
  $StudentsTable createAlias(String alias) {
    return $StudentsTable(attachedDatabase, alias);
  }
}

class Student extends DataClass implements Insertable<Student> {
  final String studentId;
  final String displayName;
  final String regNumber;
  final DateTime updatedAt;
  final DateTime nextUpdateAt;
  const Student({
    required this.studentId,
    required this.displayName,
    required this.regNumber,
    required this.updatedAt,
    required this.nextUpdateAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['student_id'] = Variable<String>(studentId);
    map['display_name'] = Variable<String>(displayName);
    map['reg_number'] = Variable<String>(regNumber);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['next_update_at'] = Variable<DateTime>(nextUpdateAt);
    return map;
  }

  StudentsCompanion toCompanion(bool nullToAbsent) {
    return StudentsCompanion(
      studentId: Value(studentId),
      displayName: Value(displayName),
      regNumber: Value(regNumber),
      updatedAt: Value(updatedAt),
      nextUpdateAt: Value(nextUpdateAt),
    );
  }

  factory Student.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Student(
      studentId: serializer.fromJson<String>(json['studentId']),
      displayName: serializer.fromJson<String>(json['displayName']),
      regNumber: serializer.fromJson<String>(json['regNumber']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      nextUpdateAt: serializer.fromJson<DateTime>(json['nextUpdateAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'studentId': serializer.toJson<String>(studentId),
      'displayName': serializer.toJson<String>(displayName),
      'regNumber': serializer.toJson<String>(regNumber),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'nextUpdateAt': serializer.toJson<DateTime>(nextUpdateAt),
    };
  }

  Student copyWith({
    String? studentId,
    String? displayName,
    String? regNumber,
    DateTime? updatedAt,
    DateTime? nextUpdateAt,
  }) => Student(
    studentId: studentId ?? this.studentId,
    displayName: displayName ?? this.displayName,
    regNumber: regNumber ?? this.regNumber,
    updatedAt: updatedAt ?? this.updatedAt,
    nextUpdateAt: nextUpdateAt ?? this.nextUpdateAt,
  );
  Student copyWithCompanion(StudentsCompanion data) {
    return Student(
      studentId: data.studentId.present ? data.studentId.value : this.studentId,
      displayName: data.displayName.present
          ? data.displayName.value
          : this.displayName,
      regNumber: data.regNumber.present ? data.regNumber.value : this.regNumber,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      nextUpdateAt: data.nextUpdateAt.present
          ? data.nextUpdateAt.value
          : this.nextUpdateAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Student(')
          ..write('studentId: $studentId, ')
          ..write('displayName: $displayName, ')
          ..write('regNumber: $regNumber, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('nextUpdateAt: $nextUpdateAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(studentId, displayName, regNumber, updatedAt, nextUpdateAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Student &&
          other.studentId == this.studentId &&
          other.displayName == this.displayName &&
          other.regNumber == this.regNumber &&
          other.updatedAt == this.updatedAt &&
          other.nextUpdateAt == this.nextUpdateAt);
}

class StudentsCompanion extends UpdateCompanion<Student> {
  final Value<String> studentId;
  final Value<String> displayName;
  final Value<String> regNumber;
  final Value<DateTime> updatedAt;
  final Value<DateTime> nextUpdateAt;
  final Value<int> rowid;
  const StudentsCompanion({
    this.studentId = const Value.absent(),
    this.displayName = const Value.absent(),
    this.regNumber = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.nextUpdateAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StudentsCompanion.insert({
    this.studentId = const Value.absent(),
    required String displayName,
    required String regNumber,
    this.updatedAt = const Value.absent(),
    this.nextUpdateAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : displayName = Value(displayName),
       regNumber = Value(regNumber);
  static Insertable<Student> custom({
    Expression<String>? studentId,
    Expression<String>? displayName,
    Expression<String>? regNumber,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? nextUpdateAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (studentId != null) 'student_id': studentId,
      if (displayName != null) 'display_name': displayName,
      if (regNumber != null) 'reg_number': regNumber,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (nextUpdateAt != null) 'next_update_at': nextUpdateAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StudentsCompanion copyWith({
    Value<String>? studentId,
    Value<String>? displayName,
    Value<String>? regNumber,
    Value<DateTime>? updatedAt,
    Value<DateTime>? nextUpdateAt,
    Value<int>? rowid,
  }) {
    return StudentsCompanion(
      studentId: studentId ?? this.studentId,
      displayName: displayName ?? this.displayName,
      regNumber: regNumber ?? this.regNumber,
      updatedAt: updatedAt ?? this.updatedAt,
      nextUpdateAt: nextUpdateAt ?? this.nextUpdateAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (studentId.present) {
      map['student_id'] = Variable<String>(studentId.value);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    if (regNumber.present) {
      map['reg_number'] = Variable<String>(regNumber.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (nextUpdateAt.present) {
      map['next_update_at'] = Variable<DateTime>(nextUpdateAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StudentsCompanion(')
          ..write('studentId: $studentId, ')
          ..write('displayName: $displayName, ')
          ..write('regNumber: $regNumber, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('nextUpdateAt: $nextUpdateAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AffiliationsTable extends Affiliations
    with TableInfo<$AffiliationsTable, Affiliation> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AffiliationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _schoolIdMeta = const VerificationMeta(
    'schoolId',
  );
  @override
  late final GeneratedColumn<String> schoolId = GeneratedColumn<String>(
    'school_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant("1"),
  );
  static const VerificationMeta _schoolNameMeta = const VerificationMeta(
    'schoolName',
  );
  @override
  late final GeneratedColumn<String> schoolName = GeneratedColumn<String>(
    'school_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _schoolCodeMeta = const VerificationMeta(
    'schoolCode',
  );
  @override
  late final GeneratedColumn<String> schoolCode = GeneratedColumn<String>(
    'school_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  @override
  List<GeneratedColumn> get $columns => [
    schoolId,
    schoolName,
    schoolCode,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'affiliations';
  @override
  VerificationContext validateIntegrity(
    Insertable<Affiliation> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('school_id')) {
      context.handle(
        _schoolIdMeta,
        schoolId.isAcceptableOrUnknown(data['school_id']!, _schoolIdMeta),
      );
    }
    if (data.containsKey('school_name')) {
      context.handle(
        _schoolNameMeta,
        schoolName.isAcceptableOrUnknown(data['school_name']!, _schoolNameMeta),
      );
    } else if (isInserting) {
      context.missing(_schoolNameMeta);
    }
    if (data.containsKey('school_code')) {
      context.handle(
        _schoolCodeMeta,
        schoolCode.isAcceptableOrUnknown(data['school_code']!, _schoolCodeMeta),
      );
    } else if (isInserting) {
      context.missing(_schoolCodeMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {schoolId};
  @override
  Affiliation map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Affiliation(
      schoolId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}school_id'],
      )!,
      schoolName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}school_name'],
      )!,
      schoolCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}school_code'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $AffiliationsTable createAlias(String alias) {
    return $AffiliationsTable(attachedDatabase, alias);
  }
}

class Affiliation extends DataClass implements Insertable<Affiliation> {
  final String schoolId;
  final String schoolName;
  final String schoolCode;
  final DateTime updatedAt;
  const Affiliation({
    required this.schoolId,
    required this.schoolName,
    required this.schoolCode,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['school_id'] = Variable<String>(schoolId);
    map['school_name'] = Variable<String>(schoolName);
    map['school_code'] = Variable<String>(schoolCode);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  AffiliationsCompanion toCompanion(bool nullToAbsent) {
    return AffiliationsCompanion(
      schoolId: Value(schoolId),
      schoolName: Value(schoolName),
      schoolCode: Value(schoolCode),
      updatedAt: Value(updatedAt),
    );
  }

  factory Affiliation.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Affiliation(
      schoolId: serializer.fromJson<String>(json['schoolId']),
      schoolName: serializer.fromJson<String>(json['schoolName']),
      schoolCode: serializer.fromJson<String>(json['schoolCode']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'schoolId': serializer.toJson<String>(schoolId),
      'schoolName': serializer.toJson<String>(schoolName),
      'schoolCode': serializer.toJson<String>(schoolCode),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Affiliation copyWith({
    String? schoolId,
    String? schoolName,
    String? schoolCode,
    DateTime? updatedAt,
  }) => Affiliation(
    schoolId: schoolId ?? this.schoolId,
    schoolName: schoolName ?? this.schoolName,
    schoolCode: schoolCode ?? this.schoolCode,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Affiliation copyWithCompanion(AffiliationsCompanion data) {
    return Affiliation(
      schoolId: data.schoolId.present ? data.schoolId.value : this.schoolId,
      schoolName: data.schoolName.present
          ? data.schoolName.value
          : this.schoolName,
      schoolCode: data.schoolCode.present
          ? data.schoolCode.value
          : this.schoolCode,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Affiliation(')
          ..write('schoolId: $schoolId, ')
          ..write('schoolName: $schoolName, ')
          ..write('schoolCode: $schoolCode, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(schoolId, schoolName, schoolCode, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Affiliation &&
          other.schoolId == this.schoolId &&
          other.schoolName == this.schoolName &&
          other.schoolCode == this.schoolCode &&
          other.updatedAt == this.updatedAt);
}

class AffiliationsCompanion extends UpdateCompanion<Affiliation> {
  final Value<String> schoolId;
  final Value<String> schoolName;
  final Value<String> schoolCode;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const AffiliationsCompanion({
    this.schoolId = const Value.absent(),
    this.schoolName = const Value.absent(),
    this.schoolCode = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AffiliationsCompanion.insert({
    this.schoolId = const Value.absent(),
    required String schoolName,
    required String schoolCode,
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : schoolName = Value(schoolName),
       schoolCode = Value(schoolCode);
  static Insertable<Affiliation> custom({
    Expression<String>? schoolId,
    Expression<String>? schoolName,
    Expression<String>? schoolCode,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (schoolId != null) 'school_id': schoolId,
      if (schoolName != null) 'school_name': schoolName,
      if (schoolCode != null) 'school_code': schoolCode,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AffiliationsCompanion copyWith({
    Value<String>? schoolId,
    Value<String>? schoolName,
    Value<String>? schoolCode,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return AffiliationsCompanion(
      schoolId: schoolId ?? this.schoolId,
      schoolName: schoolName ?? this.schoolName,
      schoolCode: schoolCode ?? this.schoolCode,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (schoolId.present) {
      map['school_id'] = Variable<String>(schoolId.value);
    }
    if (schoolName.present) {
      map['school_name'] = Variable<String>(schoolName.value);
    }
    if (schoolCode.present) {
      map['school_code'] = Variable<String>(schoolCode.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AffiliationsCompanion(')
          ..write('schoolId: $schoolId, ')
          ..write('schoolName: $schoolName, ')
          ..write('schoolCode: $schoolCode, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $StudentsTable students = $StudentsTable(this);
  late final $AffiliationsTable affiliations = $AffiliationsTable(this);
  late final StudentsDao studentsDao = StudentsDao(this as AppDatabase);
  late final AffiliationsDao affiliationsDao = AffiliationsDao(
    this as AppDatabase,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [students, affiliations];
}

typedef $$StudentsTableCreateCompanionBuilder =
    StudentsCompanion Function({
      Value<String> studentId,
      required String displayName,
      required String regNumber,
      Value<DateTime> updatedAt,
      Value<DateTime> nextUpdateAt,
      Value<int> rowid,
    });
typedef $$StudentsTableUpdateCompanionBuilder =
    StudentsCompanion Function({
      Value<String> studentId,
      Value<String> displayName,
      Value<String> regNumber,
      Value<DateTime> updatedAt,
      Value<DateTime> nextUpdateAt,
      Value<int> rowid,
    });

class $$StudentsTableFilterComposer
    extends Composer<_$AppDatabase, $StudentsTable> {
  $$StudentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get studentId => $composableBuilder(
    column: $table.studentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get regNumber => $composableBuilder(
    column: $table.regNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get nextUpdateAt => $composableBuilder(
    column: $table.nextUpdateAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$StudentsTableOrderingComposer
    extends Composer<_$AppDatabase, $StudentsTable> {
  $$StudentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get studentId => $composableBuilder(
    column: $table.studentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get regNumber => $composableBuilder(
    column: $table.regNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get nextUpdateAt => $composableBuilder(
    column: $table.nextUpdateAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StudentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $StudentsTable> {
  $$StudentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get studentId =>
      $composableBuilder(column: $table.studentId, builder: (column) => column);

  GeneratedColumn<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get regNumber =>
      $composableBuilder(column: $table.regNumber, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get nextUpdateAt => $composableBuilder(
    column: $table.nextUpdateAt,
    builder: (column) => column,
  );
}

class $$StudentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StudentsTable,
          Student,
          $$StudentsTableFilterComposer,
          $$StudentsTableOrderingComposer,
          $$StudentsTableAnnotationComposer,
          $$StudentsTableCreateCompanionBuilder,
          $$StudentsTableUpdateCompanionBuilder,
          (Student, BaseReferences<_$AppDatabase, $StudentsTable, Student>),
          Student,
          PrefetchHooks Function()
        > {
  $$StudentsTableTableManager(_$AppDatabase db, $StudentsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StudentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StudentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StudentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> studentId = const Value.absent(),
                Value<String> displayName = const Value.absent(),
                Value<String> regNumber = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime> nextUpdateAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StudentsCompanion(
                studentId: studentId,
                displayName: displayName,
                regNumber: regNumber,
                updatedAt: updatedAt,
                nextUpdateAt: nextUpdateAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> studentId = const Value.absent(),
                required String displayName,
                required String regNumber,
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime> nextUpdateAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StudentsCompanion.insert(
                studentId: studentId,
                displayName: displayName,
                regNumber: regNumber,
                updatedAt: updatedAt,
                nextUpdateAt: nextUpdateAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$StudentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StudentsTable,
      Student,
      $$StudentsTableFilterComposer,
      $$StudentsTableOrderingComposer,
      $$StudentsTableAnnotationComposer,
      $$StudentsTableCreateCompanionBuilder,
      $$StudentsTableUpdateCompanionBuilder,
      (Student, BaseReferences<_$AppDatabase, $StudentsTable, Student>),
      Student,
      PrefetchHooks Function()
    >;
typedef $$AffiliationsTableCreateCompanionBuilder =
    AffiliationsCompanion Function({
      Value<String> schoolId,
      required String schoolName,
      required String schoolCode,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });
typedef $$AffiliationsTableUpdateCompanionBuilder =
    AffiliationsCompanion Function({
      Value<String> schoolId,
      Value<String> schoolName,
      Value<String> schoolCode,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$AffiliationsTableFilterComposer
    extends Composer<_$AppDatabase, $AffiliationsTable> {
  $$AffiliationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get schoolId => $composableBuilder(
    column: $table.schoolId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get schoolName => $composableBuilder(
    column: $table.schoolName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get schoolCode => $composableBuilder(
    column: $table.schoolCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AffiliationsTableOrderingComposer
    extends Composer<_$AppDatabase, $AffiliationsTable> {
  $$AffiliationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get schoolId => $composableBuilder(
    column: $table.schoolId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get schoolName => $composableBuilder(
    column: $table.schoolName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get schoolCode => $composableBuilder(
    column: $table.schoolCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AffiliationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AffiliationsTable> {
  $$AffiliationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get schoolId =>
      $composableBuilder(column: $table.schoolId, builder: (column) => column);

  GeneratedColumn<String> get schoolName => $composableBuilder(
    column: $table.schoolName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get schoolCode => $composableBuilder(
    column: $table.schoolCode,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$AffiliationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AffiliationsTable,
          Affiliation,
          $$AffiliationsTableFilterComposer,
          $$AffiliationsTableOrderingComposer,
          $$AffiliationsTableAnnotationComposer,
          $$AffiliationsTableCreateCompanionBuilder,
          $$AffiliationsTableUpdateCompanionBuilder,
          (
            Affiliation,
            BaseReferences<_$AppDatabase, $AffiliationsTable, Affiliation>,
          ),
          Affiliation,
          PrefetchHooks Function()
        > {
  $$AffiliationsTableTableManager(_$AppDatabase db, $AffiliationsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AffiliationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AffiliationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AffiliationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> schoolId = const Value.absent(),
                Value<String> schoolName = const Value.absent(),
                Value<String> schoolCode = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AffiliationsCompanion(
                schoolId: schoolId,
                schoolName: schoolName,
                schoolCode: schoolCode,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                Value<String> schoolId = const Value.absent(),
                required String schoolName,
                required String schoolCode,
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AffiliationsCompanion.insert(
                schoolId: schoolId,
                schoolName: schoolName,
                schoolCode: schoolCode,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AffiliationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AffiliationsTable,
      Affiliation,
      $$AffiliationsTableFilterComposer,
      $$AffiliationsTableOrderingComposer,
      $$AffiliationsTableAnnotationComposer,
      $$AffiliationsTableCreateCompanionBuilder,
      $$AffiliationsTableUpdateCompanionBuilder,
      (
        Affiliation,
        BaseReferences<_$AppDatabase, $AffiliationsTable, Affiliation>,
      ),
      Affiliation,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$StudentsTableTableManager get students =>
      $$StudentsTableTableManager(_db, _db.students);
  $$AffiliationsTableTableManager get affiliations =>
      $$AffiliationsTableTableManager(_db, _db.affiliations);
}
