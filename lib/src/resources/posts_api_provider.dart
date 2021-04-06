import 'dart:convert';

import 'package:bloc_demo/src/models/Posts.dart';
import 'package:http/http.dart' show Client;

class PostsApiProvider {
  Client client = Client();

  Future<List<Posts>> getPosts() async {
    final response = await client.get(
        "https://jsonplaceholder.typicode.com/posts");

    if (response.statusCode == 200) {
      final List t = json.decode(response.body);
      final List<Posts> posts =
      t.map((item) => Posts.fromJson(item)).toList();
      return posts;
    } else {
        throw Exception("Failed to get data");
    }
  }
}