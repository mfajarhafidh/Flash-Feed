import 'package:get/get.dart';
import '../../presentation/bindings/home/home_binding.dart';
import 'routes.dart';
import '../../presentation/pages.dart';

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
