import 'package:api_integration/http/sevice/api_service.dart';
import 'package:get/get.dart';

class postcontroller extends GetxController {
  var isloading = true.obs;
  var postlist = [].obs;
  @override
  void onInit() {
    getpost();
    super.onInit();
  }

  void getpost() async {
    try {
      isloading(true);
      var post = await httpservice.fetchpost();
      if (post != null) {
        postlist.value = post;
      }
    } catch (e) {
      print(e);
    } finally {
      isloading(false);
    }
  }
}
