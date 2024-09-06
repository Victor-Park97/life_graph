import 'package:get/get.dart';
import 'package:life_graph/views/home/home_page.dart';
import 'package:life_graph/views/show/show_life_point_page.dart';
import 'package:life_graph/views/update/update_life_point_page.dart';

class GetRoutes {
  static const String home = '/';
  static const String updateLifePoint = '/updateLifePoint';
  static const String showLifePoint = '/showLifePoint';
}

class RoutesGenerator {
  static final routes = [
    GetPage(
      name: GetRoutes.home,
      page: () => const HomePage(),
    ),
    GetPage(
      name: GetRoutes.updateLifePoint,
      page: () => const UpdateLifePointPage(),
    ),
    GetPage(
      name: GetRoutes.showLifePoint,
      page: () => const ShowLifePointPage(),
    ),
  ];
}