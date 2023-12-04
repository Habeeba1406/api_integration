import 'package:api_integration/http/controller/postcontoller.dart';
import 'package:api_integration/http/screens/home/widgets/posttile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: posthome(),
  ));
}

class posthome extends StatelessWidget {
  final postcontroller post = Get.put(postcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Post Details'),
      ),
      body: SizedBox(
        child: Obx(() {
          if (post.isloading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
                itemCount: post.postlist.length,
                itemBuilder: (Context, index) {
                  return postTile(post.postlist[index]);
                });
          }
        }),
      ),
    );
  }
}
