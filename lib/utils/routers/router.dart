import 'package:get/get_navigation/src/routes/get_route.dart';
import '../../pages/home/home_page.dart';
import '404.dart';

/// AppRouter
class AppRouter {
  static bool   showDebug = false;
  static String appInitialRoute = '/';
  static String homePage = 'home-page';


  static List<GetPage> appRouter = [
    GetPage(name: '/home', page: () => HomePage()),
  ];

  static GetPage unKnowRoute = GetPage(name: "notFound", page: () => WidgetNotFound());

  static void configureRouters(AppRouter router) {

  }
}