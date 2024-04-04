import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:projeto_open/model/post_model.dart';

class PostList extends Equatable {
  final List<PostModel> posts;
  const PostList({
    required this.posts,
  });

  @override
  String toString() => 'PostList(posts: $posts)';

  @override
  List<Object> get props => [posts];

  Map<String, dynamic> toMap() {
    return {
      'posts': posts.map((x) => x.toMap()).toList(),
    };
  }

  factory PostList.fromMap(Map<String, dynamic> map) {
    return PostList(
      posts: List<PostModel>.from(map['posts']?.map((x) => PostModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory PostList.fromJson(String source) => PostList.fromMap(json.decode(source));

  PostList copyWith({
    List<PostModel>? posts,
  }) {
    return PostList(
      posts: posts ?? this.posts,
    );
  }
}
