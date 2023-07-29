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
              () => ListView.builder(
            itemCount: HomeController.controller.data.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(10),
                width: 100.w,
                height: 30.h,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                      width: 100.w,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          imageUrl: "${HomeController.controller.data[index].coverPhoto!.urls!.full}",
                          fit: BoxFit.cover,
                          progressIndicatorBuilder: (context, url, progress) =>
                              Container(
                                height: 20.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 5,
                                      spreadRadius: 2,
                                    )
                                  ],
                                ),
                              ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        HomeController.controller.index.value = index;
                        Get.toNamed('/info');
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 10, top: 5),
                        height: 7.h,
                        width: 94.7.w,
                        // color: Colors.red,
                        child: Row(
                          children: [
                            // SizedBox(width: 5,),
                            CircleAvatar(
                              radius: 25,
                              backgroundImage: NetworkImage(
                                  "${HomeController.controller.data[index].user!.profileImage!.large}"),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                                "${HomeController.controller.data[index].user!.username}"),
                            const Spacer(),
                            const Icon(
                              Icons.chevron_right,
                              size: 35,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}


