import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'routes/app_routes.dart';
import 'theme/theme_helper.dart';
import 'widgets/dismissible_widget.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  ThemeHelper().changeTheme('primary');
   await ScreenUtil.ensureScreenSize();
     SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return DismissKeyBoard(
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          theme: theme,
          title: 'forever_connection',
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.splashScreen,
          routes: AppRoutes.routes,
        ),
      ),
    );
  }
}
