import 'package:docter_admin_app_bima/routes/routesname.dart';
import 'package:docter_admin_app_bima/utils/resource.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    ()async{
      await Future.delayed(Duration(seconds: 2));
      Get.toNamed(LoginRouteView);
    }();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Image.asset(applogo),
      ),
    );
  }
}
