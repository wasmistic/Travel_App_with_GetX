import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/controller/api_client.dart';
import 'package:travel_app/pages/details_page/details_page.dart';
import 'package:travel_app/pages/home_page/home_page.dart';
import 'package:travel_app/pages/welcome_page/welcome_page.dart';
import 'package:get/get.dart';

import 'controller/api_controller.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(ApiClient());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    DataController _controller = Get.put(DataController());
    _controller.fetchMountain();
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
            statusBarColor: Colors.transparent
        )
    );
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder:(context, child){
          return GetMaterialApp(
            title: 'Flutter Chat UI',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primaryColor: Color(0xFF3EBACE),
                hintColor: Color(0xFFD8ECF1),
                scaffoldBackgroundColor: Color(0xFFF3F5F7),
                drawerTheme: DrawerThemeData(
                    scrimColor: Colors.transparent
                )
            ),
            initialRoute: '/',
            getPages: [
              GetPage(name: '/', page:()=>WelcomePage()),
              GetPage(name: '/home', page:()=>HomePage()),
              GetPage(name: '/details', page:()=>DetailsPage())
            ],
          );
        });
  }
}


