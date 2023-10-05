import 'package:american_mile/common_lib.dart';
import 'package:american_mile/core/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

final themeDataDark = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: const Color(0xFF121212),
  cardColor: const Color(0xFF181818),
  textTheme: GoogleFonts.poppinsTextTheme(
    ThemeData(brightness: Brightness.dark).textTheme,
  ),
  dividerTheme: const DividerThemeData(
    color: Colors.black12,
    thickness: 0.5,
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
      backgroundColor: const Color(0xFF089DED),
    ),
  ),
);

var _border = OutlineInputBorder(
  borderRadius: BorderRadius.circular(12),
  borderSide: const BorderSide(
    color: Color(0xFFEBEBEB),
  ),
);

final themeDataLight = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSwatch(
    accentColor: const Color(0xFF373464),
  ),
  scaffoldBackgroundColor: AppColors.background,
  textTheme: GoogleFonts.poppinsTextTheme(),
  dividerTheme: const DividerThemeData(
    color: Colors.black12,
    thickness: 0.7,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: AppColors.primary,
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    border: _border,
    focusedBorder: _border,
    enabledBorder: _border,
    outlineBorder: const BorderSide(color: Color(0xFFEBEBEB)),
    floatingLabelStyle:
        const TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
    contentPadding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      minimumSize: const Size.fromHeight(58),
      foregroundColor: Colors.white,
      textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
    foregroundColor: Colors.black,
  )),
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
      backgroundColor: AppColors.primary,
    ),
  ),
);
