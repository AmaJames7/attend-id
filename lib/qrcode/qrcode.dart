import 'package:attend_id/components/app_button_dark.dart';
import 'package:attend_id/components/bottomsheet/add_affiliations_bs.dart';
import 'package:attend_id/components/bottomsheet/add_detail_bs.dart';
import 'package:attend_id/components/adaptive_shadow.dart';
import 'package:attend_id/provider/database/student_data_provider.dart';
import 'package:attend_id/provider/timer_provider.dart';
import 'package:attend_id/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCode extends ConsumerWidget {
  const QRCode({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final int expiry = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    final theme = Theme.of(context);
    bool isDark = theme.brightness == Brightness.dark;

    final expiry = ref.watch(timestampIntervalProvider);
    final student = ref.watch(studentListProvider("")).value;

    return Container(
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.darkScaffoldBackground
            : AppColors.primaryBrand,
        image: DecorationImage(
          image: AssetImage('assets/splash_bg.png'),
          fit: BoxFit.cover,
          alignment: AlignmentGeometry.bottomRight,
          colorFilter: ColorFilter.mode(
            AppColors.darkSurfaceCard.withValues(alpha: 0.3),
            BlendMode.dstATop,
          ),
        ),
      ),
      child: Scaffold(
        // backgroundColor: AppColors.primaryBrand.withValues(alpha: 0.3),
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  // Icon(Icons.e_mobiledata_sharp, size: 80),
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(
                      isDark ? 0 : 26,
                    ),
                    child: Image.asset(
                      isDark
                          ? 'assets/app_logo_dark.webp'
                          : 'assets/app_logo.webp',
                      width: 100,
                      height: 100,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Attend-ID',
                    style: Theme.of(
                      context,
                    ).textTheme.displayMedium?.copyWith(color: AppColors.white),
                  ),
                  // SizedBox(height: 8),
                  Text(
                    'Attend QR-Code Generator',
                    style: Theme.of(
                      context,
                    ).textTheme.displaySmall?.copyWith(color: AppColors.white),
                  ),

                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          student != null && student.isNotEmpty
                              ? student.elementAt(0).regNumber
                              : "",
                          textAlign: TextAlign.right,
                          style: Theme.of(context).textTheme.labelMedium
                              ?.copyWith(
                                fontSize: 18,
                                color: AppColors.white.withValues(alpha: 0.9),
                              ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          student != null && student.isNotEmpty
                              ? student.elementAt(0).displayName
                              : "",
                          textAlign: TextAlign.right,
                          style: Theme.of(context).textTheme.labelMedium
                              ?.copyWith(
                                color: AppColors.white.withValues(alpha: 0.6),
                              ),
                        ),
                      ),
                      SizedBox(height: 2),
                      Container(
                        height: 300,
                        width: 300,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(32),
                          boxShadow: getAdaptiveShadow(context, isDeep: true),
                        ),

                        child: student != null && student.isNotEmpty
                            ? QrImageView(
                                data:
                                    '${student[0].regNumber}|${student[0].displayName}|$expiry',
                                eyeStyle: QrEyeStyle(
                                  eyeShape: QrEyeShape.circle,
                                  color: AppColors.black,
                                ),

                                dataModuleStyle: QrDataModuleStyle(
                                  dataModuleShape: QrDataModuleShape.circle,
                                  color: AppColors.black,
                                ),

                                padding: EdgeInsets.all(16),
                              )
                            : Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(25.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Welcome to  ",
                                            textAlign: TextAlign.center,
                                            style: theme.textTheme.bodyLarge,
                                          ),
                                          Text(
                                            "ATTEND-ID",
                                            textAlign: TextAlign.center,
                                            style: theme.textTheme.bodyLarge
                                                ?.copyWith(
                                                  color: AppColors.primaryBrand,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 6),
                                      Text(
                                        "please supply your display name and reg number to generate your QR code",
                                        textAlign: TextAlign.center,
                                        style: theme.textTheme.labelMedium,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                      ).animate(key: ValueKey(expiry)).flipV(),
                    ],
                  ),

                  SizedBox(height: 20),

                  AppButtonDark(
                    text: 'Update Details',
                    onPressed: () {
                      showSaveDetailsBS(context);
                    },
                    background: AppColors.white.withValues(alpha: 0.3),
                  ),

                  AppButtonDark(
                    text: 'Update Affiliations',
                    onPressed: () {
                      showSaveAffiliationsBS(context);
                    },
                    background: AppColors.white.withValues(alpha: 0.3),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
