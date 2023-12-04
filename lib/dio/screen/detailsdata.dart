import 'package:api_integration/dio/controller/datacontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailedData extends StatelessWidget {
  int index;
  DetailedData({required this.index});
  Datacontroller controller = Get.find<Datacontroller>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detailed Data',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              controller.datas[index].id.toString(),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              controller.datas[index].title!,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              controller.datas[index].body!,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
