import 'package:american_mile/common_lib.dart';
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
);

final themeDataLight = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSwatch(
    accentColor: const Color(0xFF373464),
  ),
  scaffoldBackgroundColor: const Color(0xFFFFFFFF),
  textTheme: GoogleFonts.poppinsTextTheme(),
  dividerTheme: const DividerThemeData(
    color: Colors.black12,
    thickness: 0.5,
  ),
  switchTheme: SwitchThemeData(
    // trackOutlineColor: MaterialStatePropertyAll(Colors.black26),
    trackColor: MaterialStatePropertyAll(Colors.black12),
    thumbColor: MaterialStatePropertyAll(Color(0xFF373464)),
  ),
);
