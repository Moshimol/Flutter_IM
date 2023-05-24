import 'package:get/get_navigation/src/routes/get_route.dart';
import '../../pages/contact/contact_user_page.dart';
import '../../pages/home/home_page.dart';
import '404.dart';

/// AppRouter
class AppRouter {
  static bool   showDebug = false;
  static String appInitialRoute = '/';
  static String homePage = 'home-page';


  static List<GetPage> appRouter = [
    GetPage(name: '/home', page: () => HomePage()),
    GetPage(name: "/user_page/:chat_id", page:() => ContactUserPage())
  ];

  static GetPage unKnowRoute = GetPage(name: "/notFound", page: () => WidgetNotFound());

  static void configureRouters(AppRouter router) {

  }
}