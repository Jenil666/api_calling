import 'package:api_calling/screens/home/controller/home_controller.dart';
import 'package:api_calling/screens/home/view/homeScreen.dart';
import 'package:api_calling/screens/image_info/view/image_info.dart';
import 'package:api_calling/utils/api_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main()
{
  WidgetsFlutterBinding;
  HomeController.controller.callApi();

  runApp(
    Sizer(
      builder: (context, orientation, deviceType) =>  GetMaterialApp(
        theme: ThemeData(useMaterial3: true),
        debugShowCheckedModeBanner: false,
        // initialRoute: ,
        getPages: [
          GetPage(name: '/', page: () => const HomeScreen(),),
          GetPage(name: '/info', page: () =>  ImageInfoScreen(),transition: Transition.rightToLeftWithFade),
        ],
      ),
    ),
  );
}