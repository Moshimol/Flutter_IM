import 'package:get/get_navigation/src/routes/get_route.dart';
import '../../pages/home/home_page.dart';

const String appInitialRoute = "/";

// final List<GetPage>? getPages;
/// 路由的配置文件
List<GetPage> appRouter = [
  GetPage(name: '/home', page: () => HomePage()),
];