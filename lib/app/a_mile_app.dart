import 'package:american_mile/common_lib.dart';
import 'package:american_mile/core/themes/amile_theme.dart';
import '../core/utils/index.dart';

class AMileApp extends StatelessWidget {
  const AMileApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(414, 896),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GestureDetector(
            onTap: () => KeyboardUtil.hideKeyboard(context),
            child: GetMaterialApp(
              title: "Americal Mile",
              initialRoute: AppPages.INITIAL,
              getPages: AppPages.routes,
              // darkTheme: themeDataDark,
              // theme: themeDataLight,
              debugShowCheckedModeBanner: false,
            ),
          );
        });
  }
}
