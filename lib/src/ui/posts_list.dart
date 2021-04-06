import 'package:bloc_demo/src/blocs/posts_bloc.dart';
import 'package:bloc_demo/src/models/Posts.dart';
import 'package:flutter/material.dart';

class PostsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    bloc.getPosts();
    return Scaffold(
      appBar: AppBar(title: Text('Posts'),),
      body: StreamBuilder(
        stream: bloc.posts,
        builder: (context,AsyncSnapshot<List<Posts>>snapshot){
          if(snapshot.hasData){
           // buildList(snapshot);
            return Center(child: Text('Data is ${snapshot.data[1].body}'));
          }else if(snapshot.hasError){
        return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<List<Posts>>data){
     return ListView.builder(
         padding: const EdgeInsets.all(8),
         itemCount: data.data.length,
         itemBuilder: (BuildContext context, int index) {
           return Container(
             height: 50,
             child: Center(child: Text('Entry ${data.data[index].title}')),
           );
         }
     );
  }
}
