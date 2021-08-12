import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cozy/pages/splash_page.dart';
import 'package:flutter_cozy/provider/space_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SpaceProvider(),
      child: ScreenUtilInit(
          designSize: Size(360, 690),
          builder: () {
            return GetMaterialApp(
              title: "Cozy App",
              debugShowCheckedModeBanner: false,
              home: SplashPage(),
            );
          }),
    );
  }
}
