import 'package:api_integration/http/model/postmodel.dart';
import 'package:flutter/material.dart';

class postTile extends StatelessWidget {
  final PostModel post;
  postTile(this.post);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey,
      child: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Container(
            //   height: 180,
            //   width: double.infinity,
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.all(Radius.circular(5))),
            // ),

            SizedBox(
              height: 15,
            ),
            Text(
              '${post.id!}',
            ),
            Text(
              post.title!,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            SizedBox(
              height: 10,
            ),
            Text(
              post.body!,
              style: TextStyle(
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
