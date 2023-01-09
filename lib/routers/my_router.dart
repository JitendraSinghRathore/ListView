import 'package:get/get.dart';

import '../Screens/age_screen.dart';


class MyRouter {
  static var splashScreen = "/ageScreen";
  static var welcomeScreen = "/HomeScreen";

  static var route = [
    GetPage(name: '/', page: () => const AgeScreen()),
    //GetPage(name: MyRouter.welcomeScreen, page: () => const WelcomeScreen()),



  ];
}
