import 'package:api_integration/dio/model/datamodel.dart';
import 'package:api_integration/dio/service/dataservice.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class Datacontroller extends GetxController {
  RxList<DataModel> datas = RxList();
  RxBool isLoading = true.obs;
  RxBool isListatdown = false.obs;
  RxBool isNetConnected = true.obs;

  var url = 'https://jsonplaceholder.typicode.com/posts';
  var itemcontroller = ItemScrollController();
  isInternetConnected() async {
    isNetConnected.value = await InternetConnectionChecker().hasConnection;
  }

  //To get all the datas from api
  fetchData() async {
    isInternetConnected();
    isLoading.value = true;
    var response = await DioService().getData(url);

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        datas.add(DataModel.fromJson(element));
      });
      isLoading.value = false;
    }
  }

  //scroll to down
  scrollToDown() {
    itemcontroller.scrollTo(
      index: datas.length,
      duration: Duration(seconds: 3),
      curve: Curves.easeInQuart,
    );
    isListatdown.value = true;
  }

  //scroll to up
  scrollToUp() {
    itemcontroller.scrollTo(
      index: 0,
      duration: Duration(seconds: 3),
      curve: Curves.bounceInOut,
    );
    isListatdown.value = false;
  }

  @override
  void onInit() {
    fetchData();
    isInternetConnected();
    super.onInit();
  }
}
