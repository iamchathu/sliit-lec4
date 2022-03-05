class Post {
  final int id;
  final String title;
  final String body;

  const Post({required this.id, required this.title, required this.body});

  factory Post.fromJSON(Map<String, dynamic> data) {
    return Post(
      id: data['id'],
      title: data['title'],
      body: data['body'],
    );
  }
}
