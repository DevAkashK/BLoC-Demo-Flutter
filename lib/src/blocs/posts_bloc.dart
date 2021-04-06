import 'package:bloc_demo/src/models/Posts.dart';
import 'package:bloc_demo/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class PostsBloc {
  final repository = Repository();
  final postFetcher = PublishSubject<List<Posts>>();

  Observable<List<Posts>> get posts => postFetcher.stream;

  getPosts() async {
    List<Posts> posts = await repository.getPosts();
    postFetcher.sink.add(posts);
  }

  dispose() {
    postFetcher.close();
  }
}

final bloc = PostsBloc();
