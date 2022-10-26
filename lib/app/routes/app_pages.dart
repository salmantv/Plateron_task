import 'package:get/get.dart';

import 'package:shopingapp/app/modules/cartscreen/bindings/cartscreen_binding.dart';
import 'package:shopingapp/app/modules/cartscreen/views/cartscreen_view.dart';
import 'package:shopingapp/app/modules/home/bindings/home_binding.dart';
import 'package:shopingapp/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.CARTSCREEN,
      page: () => CartscreenView(),
      binding: CartscreenBinding(),
    ),
  ];
}
