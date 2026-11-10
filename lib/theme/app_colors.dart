import 'package:flutter/material.dart';

class AppColors {


  static const Color black = Colors.black;
  static const Color white = Color.fromARGB(255, 249, 251, 255);
  static const Color green = Color(0xFF22C55E);
  static const Color amber = Color(0xFFEA580C);

  
 
  // CORE BRAND ACCENTS
  static const Color primaryBrand = Color(0xFF2563EB);
  // static const Color primaryBrand = Color.fromARGB(255, 71, 73, 233);
  static const Color primaryBrandDarkAccent = Color(0xFF3B82F6);


  // LIGHT MODE PALETTE
  static const Color lightScaffoldBackground = Color(0xFFF3F4F6);
  static const Color lightSurfaceCard = Colors.white;
  static const Color lightInputFill = Color(0xFFF1F5F9);
  static const Color lightTextPrimary = Colors.black87;
  
  

  // DARK MODE PALETTE
  static const Color darkScaffoldBackground = Color(0xFF0A0F1D); 
  static const Color darkSurfaceCard        = Color(0xFF161B2B); 
  static const Color darkInputFill          = Color(0xFF161B2B); 
  static const Color darkTextPrimary        = Color(0xFFE2E8F0); 
  static const Color darkShadowColor        = Color(0xFF03050A);




  //GRADIENT
  static const Color gradLavender      = Color(0xFFF4F1FF); // Clean bright Lavender
  static const Color gradRose          = Color(0xFFFAF0F3); // Clean bright Rose
  static const Color gradSkyBlue       = Color(0xFFF3F5FF); // Clean bright Sky Blue
  static const Color gradRichLavender  = Color(0xFFF1EEFF); // Deep premium Lavender
  static const Color gradSoftBlue      = Color(0xFFECF3FF); // Clean bright Soft Blue


  static List<Color> get premiumLightGradientX => const [
        gradLavender,
        gradRose,
        gradSkyBlue,
        gradRichLavender,
        gradSoftBlue,
        gradLavender,
        gradRose,
  ];

  static List<Color> get premiumLightGradient => const [

       gradRose,

        Color(0xFFF3F4F6),
        Color(0xFFF3F4F6),
        Color(0xFFF3F4F6),
        
        gradRose,
  ];



}