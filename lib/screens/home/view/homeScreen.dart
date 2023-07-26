import 'package:api_calling/screens/home/controller/home_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home Screen"),
        ),
        body: Obx(
          () =>  ListView.builder(
            itemCount: HomeController.controller.data.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(10),
                width: 100.w,
                child: Column(
                  children: [
                    CachedNetworkImage(
                      imageUrl: "${HomeController.controller.data[index].coverPhoto!.urls!.full}",fit: BoxFit.fill,
                      progressIndicatorBuilder: (context, url, progress) => Center(child: CircularProgressIndicator()),
                    ),
                    InkWell(
                      onTap: () {
                        HomeController.controller.index.value = index;
                        print(index);
                        Get.toNamed('/info');
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 10,top: 5),
                        height: 7.h,
                        width: 94.7.w,
                        // color: Colors.red,
                        child: Row(
                          children: [
                            // SizedBox(width: 5,),
                            CircleAvatar(
                              radius: 25,
                              backgroundImage: NetworkImage("${HomeController.controller.data[index].user!.profileImage!.large}"),
                            ),
                            SizedBox(width: 15,),
                            Text("${HomeController.controller.data[index].user!.username}"),
                            Spacer(),
                            Icon(Icons.chevron_right,size: 35,),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
          },),
        ),
      ),
    );
  }
}
