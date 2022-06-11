import 'package:docter_admin_app_bima/routes/routers.dart';
import 'package:docter_admin_app_bima/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Admin App",
      debugShowCheckedModeBanner: false,
      getPages: Routers().listRouters,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(1, 94, 203, 1),
          primaryColorDark: Color.fromRGBO(47, 87, 159, 1),
          primaryColorLight: Color.fromRGBO(250, 178, 6, 1),
      ),
      home: SplashView(),
    );
  }
}
