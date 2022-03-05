import 'package:flutter/material.dart';
import 'package:lec_4/components/post_list.dart';
import 'package:lec_4/data/post.dart';
import 'package:lec_4/pages/add_post.dart';
import 'package:lec_4/services/post_service.dart';

class Home extends StatelessWidget {
  static const String routeName = '/';
  final PostService _postService;

  const Home({Key? key})
      : _postService = const PostService(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("JSON Data"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddPost.routeName);
            },
            icon: const Icon(Icons.navigate_next),
          )
        ],
      ),
      body: FutureBuilder<List<Post>?>(
        future: _postService.getPosts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Post>? posts = snapshot.data;
            return posts != null ? PostList(posts: posts) : const Text("Empty");
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error ${snapshot.error.toString()}!"),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
