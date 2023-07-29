import 'package:api_calling/screens/home/controller/home_controller.dart';

class ImageInfoController
{
  static ImageInfoController controller = ImageInfoController._();
  ImageInfoController._();

  bool errorHandler({List? data})
  {
    try {
      data![HomeController.controller.index.value].tags![HomeController.controller.index.value].source!.description;
    } catch (e, s) {
      return false;
    }
    return true;
  }
}