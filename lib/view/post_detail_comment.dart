import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:projeto_open/controller/open_controller.dart';
import 'package:projeto_open/model/post_comment.dart';

class PostDetailComment extends StatelessWidget {
  final int index;
  final PostComment? comment;

  PostDetailComment({Key? key, required this.index, this.comment})
      : super(key: key);
  final controller = Modular.get<OpenController>();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => controller.getCommentPostById(index),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Image.asset(
            "assets/images/openLogo.png",
            scale: 3.0,
          ),
          elevation: 3.0,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
              child: ListView(shrinkWrap: true, children: [
            Text(
              'Nome: ${comment?.name[index]}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Commentário: ${comment?.body[index]}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'email: ${comment?.email[index]}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 20),
          ])),
        ),
      ),
    );
  }
}
