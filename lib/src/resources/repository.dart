import 'package:bloc_demo/src/models/Posts.dart';
import 'package:bloc_demo/src/resources/posts_api_provider.dart';

class Repository {
  final apiProvider = PostsApiProvider();

  Future<List<Posts>> getPosts() => apiProvider.getPosts();
}
