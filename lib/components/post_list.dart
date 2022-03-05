import 'package:flutter/material.dart';
import 'package:lec_4/data/post.dart';

class PostList extends StatelessWidget {
  final List<Post> posts;
  const PostList({Key? key, required this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            child: ListTile(
              title: Text(
                posts[index].title,
              ),
              subtitle: Text(
                posts[index].body,
              ),
            ),
          );
        });
  }
}
