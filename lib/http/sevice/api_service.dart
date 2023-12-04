import 'package:api_integration/http/model/postmodel.dart';
import 'package:http/http.dart' as http;

class httpservice {
  static Future<List<PostModel>> fetchpost() async {
    var response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      var data = response.body;
      return postModelFromJson(data);
    } else {
      throw Exception();
    }
  }
}
