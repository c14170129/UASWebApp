import 'package:http/http.dart' as http;
import 'dart:convert';

class commentsAPI {
  int postID;
  int id;
  String name;
  String email;
  String body;

  commentsAPI({
    required this.postID,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  factory commentsAPI.createData(Map<String, dynamic> object) {
    return commentsAPI(
      postID: object["postID"],
      id: object["id"],
      name: object["name"],
      email: object["email"],
      body: object["body"],
    );
  }

  Future<List<commentsAPI>> getPosts() async {
    final response = await http.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/posts/$postID/comments'));

    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((e) => new commentsAPI.createData(e)).toList();
  }
}
