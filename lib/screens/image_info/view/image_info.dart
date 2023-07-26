import 'package:api_calling/screens/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ImageInfoScreen extends StatelessWidget {
  const ImageInfoScreen({super.key});

    @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Information"),
        ),
        body: SingleChildScrollView(
          child: Obx(
            () =>  Column(
              children: [
                const SizedBox(height: 20,),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 150,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Image.network("${HomeController.controller.data[HomeController.controller.index.value].user!.profileImage!.large}",fit: BoxFit.cover,),
                  ),
                ),
                const SizedBox(height: 20,),
                Card(
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("Title",style: TextStyle(fontSize: 15.sp),),
                            const Spacer(),
                            Text("${HomeController.controller.data[HomeController.controller.index.value].title}",style: TextStyle(fontSize: 15.sp),),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text("Name",style: TextStyle(fontSize: 15.sp),),
                            const Spacer(),
                            Text("${HomeController.controller.data[HomeController.controller.index.value].user!.username}",style: TextStyle(fontSize: 15.sp),),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text("Published at",style: TextStyle(fontSize: 15.sp),),
                            const Spacer(),
                            Text("${HomeController.controller.data[HomeController.controller.index.value].publishedAt!.day}-${HomeController.controller.data[HomeController.controller.index.value].publishedAt!.month}-${HomeController.controller.data[HomeController.controller.index.value].publishedAt!.year}",style: TextStyle(fontSize: 15.sp),),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text("Description",style: TextStyle(fontSize: 15.sp),),
                             Spacer(),
                            SizedBox(width: 180,child: HomeController.controller.index.value<6?Text("${HomeController.controller.data[HomeController.controller.index.value].tags![HomeController.controller.index.value].source!.description}",textAlign: TextAlign.right,style: TextStyle(fontSize: 15.sp),):Text("Comming Soon",style: TextStyle(fontSize: 15.sp),),),
                          ],
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
