import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';

import 'core/resources/route_manager.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RoutesManager.onGenerateRoute,
          initialRoute: RoutesName.onBoardingScreen,
          // routes: RoutesManager.routes,
          theme: ThemeData.light()
              .copyWith(scaffoldBackgroundColor: Colors.white)),
    );
  }
}
