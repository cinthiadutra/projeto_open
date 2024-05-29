// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:projeto_open/model/post_comment.dart';
import 'package:projeto_open/model/post_model.dart';

enum HomeStatus { initial, loading, loaded, failure }

class HomeState {
  final HomeStatus status;
  final List<PostModel>? post;
  final PostModel? model;
  final List<PostComment>? comment;
  HomeState( {this.status = HomeStatus.initial, this.post, this.model,this.comment,});

  HomeState copyWith({
    HomeStatus? status,
    List<PostModel>? post,
    PostModel? model,
    List<PostComment>? comment
  }) {
    return HomeState(
      status: status ?? this.status,
      post: post ?? this.post,
      model: model ?? this.model,
      comment: comment?? this.comment
    );
  }
}
