import 'package:bloc/bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projeto_open/controller/open_service.dart';
import 'package:projeto_open/controller/open_status.dart';
import 'package:projeto_open/model/post_comment.dart';
import 'package:projeto_open/model/post_model.dart';

class OpenController extends Cubit<HomeState> {
  final OpenService openService = Modular.get<OpenService>();

  OpenController() : super(HomeState());

  List<PostModel> listaPostagens = [];
  List<PostComment> listacomments = [];

  Future<void> getPostById(int id) async {
    emit(state.copyWith(status: HomeStatus.loading));
    try {
      final post = await openService.fetchPostById(id);
      emit(state.copyWith(status: HomeStatus.loaded, model: post));
    } catch (e) {
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }

  Future<void> getAllPosts() async {
    emit(state.copyWith(status: HomeStatus.loading));

    try {
      final posts = await openService.getAllPost();
      listaPostagens.addAll(posts);
      emit(state.copyWith(status: HomeStatus.loaded, post: posts));
    } catch (e) {
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }

  Future<void> getCommentPostById(int postId) async {
    emit(state.copyWith(status: HomeStatus.loading));
    try {
      final comments = await openService.getCommentPost(postId);
      listacomments.addAll(comments);
      emit(state.copyWith(status: HomeStatus.loaded, comment: comments));
    } catch (e) {
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }
}
