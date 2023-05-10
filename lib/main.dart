import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constance/color_const.dart';
import 'package:quiz_app/routing/pages.dart';
import 'package:quiz_app/routing/routes.dart';

import 'db_controller/db_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 808),
      builder: (context, child) => GetMaterialApp(
        title: 'Quiz app',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        initialRoute: Routes.login,
        getPages: AppPages.pages,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: ColorConst.backgroundColor,
            elevation: 0,
          ),
          drawerTheme: DrawerThemeData(
            backgroundColor: ColorConst.backgroundColor,
          ),
          scaffoldBackgroundColor: ColorConst.backgroundColor,
        ),
      ),
    );
  }
}
