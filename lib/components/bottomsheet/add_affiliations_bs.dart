import 'package:attend_id/components/app_avatar.dart';
import 'package:attend_id/components/app_button.dart';
import 'package:attend_id/components/app_chip.dart';
import 'package:attend_id/components/bottomsheet/app_bottom_sheet_header.dart';
import 'package:attend_id/components/bottomsheet/sheet_page.dart';
import 'package:attend_id/components/bottomsheet/variable_size_bottom_sheet.dart';
import 'package:attend_id/components/group_header.dart';
import 'package:attend_id/components/group_pane.dart';
import 'package:attend_id/components/textfield_group_item.dart';
import 'package:attend_id/database/app_database.dart';
import 'package:attend_id/provider/database/affiliation_dao_provider.dart';
import 'package:attend_id/provider/database/affiliation_data_provider.dart';
// import 'package:attend_id/utility/app_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_riverpod/legacy.dart';

// final isPinnedNotifier = StateProvider((ref) => true);

void showSaveAffiliationsBS(BuildContext context) {
  showVariableSizedSheet(context, sheetItem: FormContent());
}

class FormContent extends ConsumerStatefulWidget {
  const FormContent({super.key});

  @override
  ConsumerState<FormContent> createState() => _AddCourseFormContentState();
}

class _AddCourseFormContentState extends ConsumerState<FormContent> {
  late final TextEditingController name;
  late final TextEditingController code;

  bool _hasLoadedAffiliation = false;

  @override
  void initState() {
    super.initState();
    name = TextEditingController();
    code = TextEditingController();
  }

  @override
  void dispose() {
    name.dispose();
    code.dispose();
    super.dispose();
  }

  Future<void> _save(List<Affiliation>? affiliation) async {
    await ref
        .read(affiliationsDaoProvider)
        .saveAffiliation(
          schoolName: name.text.trim(),
          schoolCode: code.text.trim(),
        );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final affiliation = ref.watch(affiliationListProvider("")).value;

    if (affiliation != null && !_hasLoadedAffiliation) {
      if (affiliation.isNotEmpty) {
        name.text = affiliation[0].schoolName;
        code.text = affiliation[0].schoolCode;
      }

      _hasLoadedAffiliation = true;
    }

    return SheetPage(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppBottomSheetHeader(
            bottomSpacing: 30,
            title: "Add Affiliation",
            subtitle: "Enter the school name and school code",

            avatar: AppAvatar(assetImage: "assets/file.webp", size: 120),
          ),

          GroupHeader(title: "ENTER NAME", zeroPadding: true),
          SizedBox(height: 8),
          GroupPane(
            children: [
              TextFieldGroupItem(
                icon: Icons.edit_rounded,
                title: "Enter School name",
                controller: name,
                type: TextInputType.name,
                actionType: TextInputAction.done,
              ),

              Row(
                children: [
                  Expanded(
                    child: TextFieldGroupItem(
                      icon: Icons.edit_rounded,
                      title: "Enter School Code",
                      controller: code,
                      type: TextInputType.name,
                      actionType: TextInputAction.done,
                    ),
                  ),
                  ValueListenableBuilder<TextEditingValue>(
                    valueListenable: code,
                    builder: (context, value, child) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: AppChip(label: value.text.length.toString()),
                      );
                    },
                  ),
                  //   ],
                  // ),
                ],
              ),

              const SizedBox(height: 10),
            ],
          ),
        ],
      ),

      bottomItem: AppButton(
        text: "Save affiliation",
        icon: Icons.edit_square,
        onPressed: () {
          _save(affiliation);
        },
      ),
    );
  }
}
