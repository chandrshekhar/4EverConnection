import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:forever_connection/Feature/Contact/Controller/contact_controller.dart';
import 'package:forever_connection/routes/app_routes.dart';
import 'package:get/get.dart';

import 'theme/theme_helper.dart';
import 'widgets/dismissible_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ThemeHelper().changeTheme('primary');
  await ScreenUtil.ensureScreenSize();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final contactController = Get.put(ContactController());

  @override
  Widget build(BuildContext context) {
    return DismissKeyBoard(
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        child: GetMaterialApp(
          theme: ThemeData.light(),
          themeMode: ThemeMode.light,
          title: 'forever_connection',
          debugShowCheckedModeBanner: false,
          // home: const AuthScreen(),
          initialRoute: AppRoutes.splashScreen,
          routes: AppRoutes.routes,
        ),
      ),
    );
  }
}
