import 'dart:convert';

import 'package:equatable/equatable.dart';

class PostComment extends Equatable {
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;
  const PostComment({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  @override
  List<Object> get props {
    return [
      postId,
      id,
      name,
      email,
      body,
    ];
  }

  @override
  String toString() {
    return 'PostComment(postId: $postId, id: $id, name: $name, email: $email, body: $body)';
  }

  Map<String, dynamic> toMap() {
    return {
      'postId': postId,
      'id': id,
      'name': name,
      'email': email,
      'body': body,
    };
  }

  factory PostComment.fromMap(Map<String, dynamic> map) {
    return PostComment(
      postId: map['postId']?.toInt() ?? 0,
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      body: map['body'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PostComment.fromJson(String source) =>
      PostComment.fromMap(json.decode(source));

  PostComment copyWith({
    int? postId,
    int? id,
    String? name,
    String? email,
    String? body,
  }) {
    return PostComment(
      postId: postId ?? this.postId,
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      body: body ?? this.body,
    );
  }
}
