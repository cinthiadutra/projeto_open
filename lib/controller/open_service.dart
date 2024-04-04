import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:projeto_open/model/post_comment.dart';
import 'package:projeto_open/model/post_model.dart';

class OpenService {
  Dio dio = Dio();

  final baseUrl = 'https://jsonplaceholder.typicode.com';

  OpenService() {
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        responseBody: true,
        requestBody: true,
        responseHeader: false,
        requestHeader: false,
      ),
    );
  }

  Future<List<PostModel>> getAllPost() async {
    try {
      final response =
          await dio.get("https://jsonplaceholder.typicode.com/posts");
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => PostModel.fromMap(json)).toList();
      } else {
        throw Exception('Erro ao carregar os posts');
      }
    } catch (e, s) {
      log('deu erro', error: e, stackTrace: s);
      return throw 'Erro ao buscar post';
    }
  }

  Future<PostModel?> fetchPostById(int id) async {
    try {
      final response = await dio.get('$baseUrl/posts/$id');
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;
        return PostModel.fromMap(data);
      } else {
        throw Exception('Erro ao buscar post por ID');
      }
    } catch (e) {
      throw Exception('Erro ao buscar post por ID: $e');
    }
  }

  Future<List<PostComment>> getCommentPost(int postId) async {
    try {
      final response =
          await dio.get("https://jsonplaceholder.typicode.com/posts/$postId/comments");
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => PostComment.fromMap(json)).toList();
      } else {
        throw Exception('Erro ao carregar os comentários');
      }
    } catch (e, s) {
      log('deu erro', error: e, stackTrace: s);
      return throw 'Erro ao buscar comentários';
    }
  }
}
