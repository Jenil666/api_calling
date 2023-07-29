import 'package:api_calling/screens/home/controller/home_controller.dart';
import 'package:api_calling/screens/image_info/controller/image_info_contoller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ImageInfoScreen extends StatelessWidget {
  const ImageInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool? check;
    check = ImageInfoController.controller.errorHandler(data: HomeController.controller.data);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 3,
          title: const Text("Information"),
        ),
        body: SingleChildScrollView(
          child: Obx(
            () => Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 180,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        "${HomeController.controller.data[HomeController.controller.index.value].user!.profileImage!.large}",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Card(
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Title",
                              style: TextStyle(fontSize: 15.sp),
                            ),
                            const Spacer(),
                            SizedBox(
                              width: 55.w,
                              child: Text(
                                "${HomeController.controller.data[HomeController.controller.index.value].title}",
                                style: TextStyle(fontSize: 15.sp,),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "Name",
                              style: TextStyle(fontSize: 15.sp),
                            ),
                            const Spacer(),
                            Text(
                              "${HomeController.controller.data[HomeController.controller.index.value].user!.username}",
                              style: TextStyle(fontSize: 15.sp),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "Published at",
                              style: TextStyle(fontSize: 15.sp),
                            ),
                            const Spacer(),
                            Text(
                              "${HomeController.controller.data[HomeController.controller.index.value].publishedAt!.day}-${HomeController.controller.data[HomeController.controller.index.value].publishedAt!.month}-${HomeController.controller.data[HomeController.controller.index.value].publishedAt!.year}",
                              style: TextStyle(fontSize: 15.sp),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(),
                        SizedBox(height: 3.h,),
                        Column(
                          children: [
                            Text(
                              "Description",
                              style: TextStyle(fontSize: 15.sp),
                            ),
                            SizedBox(height: 3.h,),
                            check==true?Text("${HomeController.controller.data[HomeController.controller.index.value].tags![HomeController.controller.index.value].source!.description}"):const Text("Not available"),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



