import 'package:admin_app/core/setting_services.dart';
import 'package:admin_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/src/screenutil_init.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  
  runApp(const MyApp());
}

Future initialServices() async {
  await Get.putAsync(() => SettingServices().init());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Ecommerce Admin',
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          initialRoute: "/",
          getPages: routes,
        );
      },
    );
  }
}
