
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart'; // Import your new color palette file

class AppTheme {

  static List<BoxShadow> get softShadow => [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.04),
          blurRadius: 16,
          offset: const Offset(0, 4),
        ),
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.02),
          blurRadius: 4,
          offset: const Offset(0, 2),
        ),
      ];

  // Reusable text theme styling
  static TextTheme _buildTextTheme(Color baseColor) {
    return TextTheme(


      displayLarge: TextStyle(
        color: baseColor, 
        fontWeight: FontWeight.bold, 
        fontSize: 40
      ),

      displayMedium: TextStyle(
        color: baseColor, 
        fontWeight: FontWeight.bold, 
        fontSize: 30
      ),

      displaySmall: TextStyle(
        color: baseColor, 
        fontWeight: FontWeight.bold, 
        fontSize: 20
      ),
      
      bodyLarge: TextStyle(
        color: baseColor.withValues(alpha: 0.8), 
        fontSize: 20
      ),
      
      bodyMedium: TextStyle(
        color: baseColor.withValues(alpha: 0.8), 
        fontSize: 15
      ),

      bodySmall: TextStyle(
        color: baseColor.withValues(alpha: 0.8), 
        fontSize: 12,
        // fontWeight: FontWeight.bold
      ),


      labelSmall: TextStyle(
      color: baseColor.withValues(alpha: 0.5),
      fontSize: 12,
      ),

      labelMedium: TextStyle(
      color: baseColor.withValues(alpha: 0.5), 
      fontSize: 15,
      ),

      labelLarge: TextStyle(
      color: baseColor.withValues(alpha: 0.5), 
      fontSize: 17,
      ),


    );
  }



  // LIGHT THEME (Gradient Capable)
  static ThemeData get lightTheme {
    final baseColorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.primaryBrand,
      brightness: Brightness.light,
      surface: AppColors.lightScaffoldBackground, 
      surfaceContainer: AppColors.lightSurfaceCard, 
    ).copyWith(
  primary: AppColors.primaryBrand,
);

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: baseColorScheme,
      scaffoldBackgroundColor: Colors.transparent,
      textTheme: _buildTextTheme(AppColors.lightTextPrimary),

      shadowColor: AppColors.primaryBrand.withValues(alpha: 0.25),
      splashColor: AppColors.primaryBrand.withValues(alpha: 0.1),       
      highlightColor: AppColors.primaryBrand.withValues(alpha: 0.04),

      // extensions: <ThemeExtension<dynamic>>[
      //   const WoltModalSheetThemeData(
      //     mainContentScrollPhysics: BouncingScrollPhysics(),
      //   ),
      // ],

      
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.primaryBrand),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,        
          statusBarIconBrightness: Brightness.dark,  
          statusBarBrightness: Brightness.light,     
        ),
      ),

      dividerTheme: DividerThemeData(
        color: AppColors.lightTextPrimary.withValues(alpha: 0.06), // Light mode color
        thickness: 0.5,
        space: 1,
      ),

      cardTheme: CardThemeData(
        elevation: 8, 
        color: AppColors.lightSurfaceCard.withValues(alpha: 0.95),
        shadowColor: Colors.black.withValues(alpha: 0.04), // Clean separation shadow
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28), 
          side: BorderSide.none, 
        ),
        clipBehavior: Clip.antiAlias,
      ),

      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryBrand,
        foregroundColor: Colors.white,
        elevation: 8,
        
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),


      switchTheme: SwitchThemeData(
        trackOutlineColor: WidgetStatePropertyAll(Colors.transparent),
        trackOutlineWidth: WidgetStatePropertyAll(0),
        thumbColor: WidgetStateProperty.resolveWith((states) => states.contains(WidgetState.selected) ? Colors.white : AppColors.primaryBrand.withValues(alpha: 0.4)),
        trackColor: WidgetStateProperty.resolveWith((states) => states.contains(WidgetState.selected) ? AppColors.primaryBrand : AppColors.primaryBrand.withValues(alpha: 0.1)),
      ),

      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: baseColorScheme.surface,
        elevation: 8,
        shadowColor: Colors.black.withValues(alpha: 0.05),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(26))),
        clipBehavior: Clip.antiAlias,
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,

        // fillColor: AppColors.lightInputFill,

        fillColor: baseColorScheme.surface.withValues(alpha: 0.8),

        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.primaryBrand.withValues(alpha: 0.5), width: 1.5),
        ),
      ),


      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryBrand,
          foregroundColor: Colors.white,
          elevation: 2,
          padding: EdgeInsets.only(left: 12, right: 12),
          shadowColor: AppColors.primaryBrand.withValues(alpha: 0.25),
          // minimumSize: const Size.fromHeight(50),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: TextStyle(fontSize: 15, ),
          // minimumSize: Size.fromWidth(10),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          backgroundColor: AppColors.primaryBrand.withValues(alpha: 0.05),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        )
      ),

      iconTheme: IconThemeData(
        color: AppColors.black.withValues(alpha: 0.45)
      ),

      chipTheme: ChipThemeData(
        padding: EdgeInsets.symmetric(horizontal: 3, vertical: 0),
        side: BorderSide.none,
        surfaceTintColor: Colors.transparent,
        // backgroundColor: AppColors.darkScaffoldBackground.withValues(alpha: 0.05),
        shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
        labelStyle: TextStyle(
          fontSize: 12,
          color: AppColors.lightTextPrimary
        )
      ),

       iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          foregroundColor: AppColors.black.withValues(alpha: 0.45),
          // backgroundColor: AppColors.primaryBrand.withValues(alpha: 0.0),
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        )
      ),

      




    );
  }




  // DARK THEME (Solid Backdrop)
  static ThemeData get darkTheme {
      final baseColorScheme = ColorScheme.fromSeed(
        seedColor: AppColors.primaryBrand,
        brightness: Brightness.dark,
        surface: AppColors.darkScaffoldBackground,
        surfaceContainer: AppColors.darkSurfaceCard,
      ).copyWith(
    primary: AppColors.primaryBrand,
  );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: baseColorScheme,
      scaffoldBackgroundColor: AppColors.darkScaffoldBackground, 
      textTheme: _buildTextTheme(AppColors.darkTextPrimary),

      splashColor: AppColors.primaryBrandDarkAccent.withValues(alpha: 0.15),
      highlightColor: AppColors.primaryBrandDarkAccent.withValues(alpha: 0.05),


      // extensions: <ThemeExtension<dynamic>>[
      //   const WoltModalSheetThemeData(
      //     mainContentScrollPhysics: BouncingScrollPhysics(),
      //   ),
      // ],


      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light, 
          statusBarBrightness: Brightness.dark,      
        ),
      ),


      dividerTheme: DividerThemeData(
        color: AppColors.darkTextPrimary.withValues(alpha: 0.08), // Dark mode color
        thickness: 0.5,
        space: 1,
      ),


      cardTheme: CardThemeData(
        elevation: 12, 
        color: AppColors.darkSurfaceCard,
        shadowColor: AppColors.black.withValues(alpha: 0.05), 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
          side: BorderSide.none,
        ),
        clipBehavior: Clip.antiAlias,
      ),

      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryBrand, 
        foregroundColor: Colors.white,
        elevation: 0, 
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      ),

      switchTheme: SwitchThemeData(

        trackOutlineColor: WidgetStatePropertyAll(Colors.transparent),
        trackOutlineWidth: WidgetStatePropertyAll(0),
        thumbColor: WidgetStateProperty.resolveWith((states) => states.contains(WidgetState.selected) ? Colors.white : AppColors.white.withValues(alpha: 0.4)),
        trackColor: WidgetStateProperty.resolveWith((states) => states.contains(WidgetState.selected) ? AppColors.primaryBrand : AppColors.white.withValues(alpha: 0.1)),
      ),

      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: baseColorScheme.surface,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(26))),
        clipBehavior: Clip.antiAlias,
      ),


      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        // fillColor: AppColors.darkInputFill, 

        fillColor: baseColorScheme.surface.withValues(alpha: 0.5),

        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primaryBrand, width: 1.5),
        ),
      ),


      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryBrand,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: EdgeInsets.only(left: 12, right: 12),
          // minimumSize: const Size.fromHeight(52),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        ),
      ),


      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: TextStyle(fontSize: 15, ),
          // minimumSize: Size.fromWidth(10),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          backgroundColor: AppColors.white.withValues(alpha: 0.02),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        )
      ),


      iconTheme: IconThemeData(
        color: AppColors.white
      ),

      chipTheme: ChipThemeData(
        
        padding: EdgeInsets.symmetric(horizontal: 3, vertical: 0),
        side: BorderSide.none,
        surfaceTintColor: Colors.transparent,
        // backgroundColor: AppColors.lightScaffoldBackground.withValues(alpha: 0.04),
        shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
        labelStyle: TextStyle(
          fontSize: 12,
          color: AppColors.darkTextPrimary
        )
      ),

      


      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          foregroundColor: AppColors.white,
          // backgroundColor: AppColors.white.withValues(alpha: 0.02),
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        )
      )


      
    );
  }
}