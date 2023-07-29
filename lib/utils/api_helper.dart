import 'dart:convert';

import 'package:api_calling/screens/home/modal/image_modal.dart';
import 'package:http/http.dart' as http;

class ApiHelper
{
  static ApiHelper apiHelper = ApiHelper._();
  ApiHelper._();

  Future<List<ImagesModal>> getApi()
  async {

    String link = "https://api.unsplash.com/collections/?client_id=jqn6CxC2JGl2JWhv7dw-LpAlmUDqtj_v9HK4Wy-gT9c";
    Uri uri = Uri.parse(link);
    var res = await http.get(uri);
    List json = jsonDecode(res.body);
    List<ImagesModal> data = json.map((e) => ImagesModal.fromJson(e)).toList();
    // print("==================================================");
    // print(data[1].coverPhoto!.urls!.raw);
    return data;
  }
}