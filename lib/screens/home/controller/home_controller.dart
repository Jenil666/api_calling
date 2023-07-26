import 'package:api_calling/screens/home/modal/image_modal.dart';
import 'package:api_calling/utils/api_helper.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
{
  static HomeController controller = HomeController._();
  HomeController._();


  RxInt index = 0.obs;
  RxList<ImagesModal> data = <ImagesModal>[].obs;
  RxList date = [].obs;

  Future<void> callApi()
  async {
    // print("==================================");
    // print("MethodCalled");
    data.value = await ApiHelper.apiHelper.getApi();
  }
}