import 'dart:developer';

import 'package:asuka/asuka.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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
      final response = await dio
          .get("https://jsonplaceholder.typicode.com/posts/$postId/comments");
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

  Future<void> deletPost(int id) async {
    try {
      final response =
          await dio.delete("https://jsonplaceholder.typicode.com/posts/$id");
      if (response.statusCode == 200) {
        return AsukaMaterialBanner.alert('Post Deletado com sucesso').show();
      } else {
        throw Exception('Erro ao carregar os comentários');
      }
    } catch (e, s) {
      log('deu erro', error: e, stackTrace: s);
    }
  }

  Future<PostModel> addPost(
    String title,
    String body,
  ) async {
    try {
      final response = await dio.post(
          "https://jsonplaceholder.typicode.com/posts",
          data: {'title': title, 'body': body, 'userId': 11});
      final Map<String, dynamic> data = response.data;
      return PostModel.fromMap(data);
    } catch (e, s) {
      log('deu erro', error: e, stackTrace: s);
      return throw Exception('Erro ao criar dados');
    }
  }
}
