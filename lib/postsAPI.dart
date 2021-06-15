import 'package:http/http.dart' as http;
import 'dart:convert';

class postsAPI {
  int userId;
  int id;
  String title;
  String body;

  postsAPI({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory postsAPI.createData(Map<String, dynamic> object) {
    return postsAPI(
      userId: object["userId"],
      id: object["id"],
      title: object["title"],
      body: object["body"],
    );
  }

  static Future<List<postsAPI>> getPosts() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/'));

    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((e) => new postsAPI.createData(e)).toList();
  }
}
