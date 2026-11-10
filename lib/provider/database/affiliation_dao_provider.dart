// Global provider declaration

import 'package:attend_id/database/daos/affiliations_dao.dart';
import 'package:attend_id/provider/database/database_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final affiliationsDaoProvider = Provider<AffiliationsDao>((ref) {
  return ref.watch(databaseProvider).affiliationsDao;
});
