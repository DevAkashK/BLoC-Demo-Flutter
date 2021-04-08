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
            return Container(
              child: ListView.builder(itemCount: snapshot.data.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (BuildContext context,int index){
                final title=snapshot.data[index].title;
                  return Card(child: ListTile(title:Text(title)));
                })
            );
           // return Center(child: Text('Data is ${snapshot.data[1].body}'));
          }else if(snapshot.hasError){
        return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<List<Posts>>data){

  }
}
