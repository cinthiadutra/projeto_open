import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:projeto_open/controller/open_controller.dart';
import 'package:projeto_open/model/post_comment.dart';
import 'package:projeto_open/model/post_model.dart';

class PostDetailPage extends StatelessWidget {
  final int index;
  final PostModel? model;
  final List<PostComment>? comment;

  PostDetailPage({Key? key, required this.index, this.model, this.comment})
      : super(key: key);
  final controller = Modular.get<OpenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.green),
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
          const SizedBox(height: 10),
          Text(
            'Titulo: ${model?.title}',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            ' ${model?.body}',
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 20),
          const Divider(),
          const Text(
            'Comentarios:',
            style: TextStyle(
                fontSize: 12,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 400,
            child: FutureBuilder(
                future: controller.getCommentPostById(model?.id ?? 0),
                builder: (context, snap) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: comment?.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(comment?[index].email ?? ''),
                          subtitle: Text(comment?[index].body ?? ''),
                        );
                      });
                }),
          )
        ])),
      ),
    );
  }
}
