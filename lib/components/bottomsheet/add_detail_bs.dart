import 'package:attend_id/components/app_avatar.dart';
import 'package:attend_id/components/app_button.dart';
import 'package:attend_id/components/app_chip.dart';
import 'package:attend_id/components/bottomsheet/app_bottom_sheet_header.dart';
import 'package:attend_id/components/bottomsheet/sheet_page.dart';
import 'package:attend_id/components/bottomsheet/variable_size_bottom_sheet.dart';
import 'package:attend_id/components/group_header.dart';
import 'package:attend_id/components/group_pane.dart';
import 'package:attend_id/components/textfield_group_item.dart';
// import 'package:attend_id/database/app_database.dart';
import 'package:attend_id/provider/database/student_dao_provider.dart';
import 'package:attend_id/provider/database/student_data_provider.dart';
import 'package:attend_id/utility/app_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_riverpod/legacy.dart';

// final isPinnedNotifier = StateProvider((ref) => true);

void showSaveDetailsBS(BuildContext context) {
  showVariableSizedSheet(context, sheetItem: FormContent());
}

class FormContent extends ConsumerStatefulWidget {
  const FormContent({super.key});

  @override
  ConsumerState<FormContent> createState() => _AddCourseFormContentState();
}

class _AddCourseFormContentState extends ConsumerState<FormContent> {
  late final TextEditingController reg;
  late final TextEditingController name;

  bool _hasLoadedStudent = false;

  @override
  void initState() {
    super.initState();
    reg = TextEditingController();
    name = TextEditingController();
  }

  @override
  void dispose() {
    reg.dispose();
    name.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final students = await ref.read(studentListProvider("").future);

    if (students.isNotEmpty) {
      final canUpdate = !DateTime.now().isBefore(students[0].nextUpdateAt);

      if (!canUpdate) return;
    }

    await ref
        .read(studentsDaoProvider)
        .saveStudent(displayName: name.text.trim(), regNumber: reg.text.trim());

    if (!mounted) return;
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final student = ref.watch(studentListProvider("")).value;

    if (student != null && !_hasLoadedStudent) {
      if (student.isNotEmpty) {
        name.text = student[0].displayName;
        reg.text = student[0].regNumber;
      }

      _hasLoadedStudent = true;
    }

    return SheetPage(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppBottomSheetHeader(
            bottomSpacing: 30,
            title: "Add Details",
            subtitle:
                "Fill out your name and registration number\n${student != null && student.isNotEmpty ? 'next update on ' + AppCalendar.getDateFrom(student[0].nextUpdateAt) + " " + AppCalendar.getTimeFrom(student[0].nextUpdateAt) : 'Enter your details to get started.'}",
            avatar: AppAvatar(assetImage: "assets/file.webp", size: 120),
          ),

          GroupHeader(title: "ENTER DETAILS", zeroPadding: true),
          SizedBox(height: 8),
          GroupPane(
            children: [
              TextFieldGroupItem(
                icon: Icons.edit_rounded,
                title: "Enter Student name",
                controller: name,
                type: TextInputType.name,
                actionType: TextInputAction.next,
              ),

              Row(
                children: [
                  Expanded(
                    child: TextFieldGroupItem(
                      icon: Icons.edit_rounded,
                      title: "Enter Matriculation number",
                      controller: reg,
                      type: TextInputType.name,
                      actionType: TextInputAction.done,
                    ),
                  ),
                  ValueListenableBuilder<TextEditingValue>(
                    valueListenable: reg,
                    builder: (context, value, child) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: AppChip(label: value.text.length.toString()),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 10),
        ],
      ),

      bottomItem: AppButton(
        text: "Save details",
        icon: Icons.edit_square,
        onPressed: () {
          _save();
        },
      ),
    );
  }
}
