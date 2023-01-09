import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:practical_interview/resource/app_theme.dart';
import 'package:practical_interview/routers/my_router.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child){
        return GetMaterialApp(
          title: 'Practical',
          debugShowCheckedModeBanner: false,
          getPages: MyRouter.route,
          theme: ThemeData(
              primarySwatch: primaryColorShades,
              fontFamily: "Roboto"
          ),
        );
      },
    );
  }
}


