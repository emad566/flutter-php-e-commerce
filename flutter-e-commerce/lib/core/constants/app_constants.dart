import 'package:google_fonts/google_fonts.dart';

abstract class AppConstants {
  static get transitionDuration => const Duration(milliseconds: 900);
  static var primaryFontFamily = GoogleFonts.playfairDisplay().fontFamily;
  static get secondaryFontFamily => GoogleFonts.cairo().fontFamily;
}
