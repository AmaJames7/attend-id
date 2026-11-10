// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'affiliations_dao.dart';

// ignore_for_file: type=lint
mixin _$AffiliationsDaoMixin on DatabaseAccessor<AppDatabase> {
  $AffiliationsTable get affiliations => attachedDatabase.affiliations;
  AffiliationsDaoManager get managers => AffiliationsDaoManager(this);
}

class AffiliationsDaoManager {
  final _$AffiliationsDaoMixin _db;
  AffiliationsDaoManager(this._db);
  $$AffiliationsTableTableManager get affiliations =>
      $$AffiliationsTableTableManager(_db.attachedDatabase, _db.affiliations);
}
