import 'package:attend_id/database/app_database.dart';
import 'package:attend_id/provider/database/affiliation_dao_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final affiliationListProvider = StreamProvider.autoDispose
    .family<List<Affiliation>, String>((ref, id) {
      return ref.read(affiliationsDaoProvider).watchAffiliations();
    });
