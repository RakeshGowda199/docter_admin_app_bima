import 'package:docter_admin_app_bima/routes/routesname.dart';
import 'package:docter_admin_app_bima/views/login_view.dart';
import 'package:docter_admin_app_bima/views/splash_view.dart';
import 'package:get/get.dart';

class Routers{
  var listRouters=[
    GetPage(name:"/",page: ()=> SplashView()),
    GetPage(name:LoginRouteView,page: ()=> LoginView())
  ];
}