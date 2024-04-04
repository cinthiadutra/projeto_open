import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:projeto_open/controller/open_controller.dart';
import 'package:projeto_open/controller/open_status.dart';
import 'package:projeto_open/model/post_comment.dart';
import 'package:projeto_open/model/post_model.dart';

class PostDetailPage extends StatefulWidget {
  final int index;
  final PostModel? model;
  final List<PostComment>? comment;

  const PostDetailPage({
    Key? key,
    required this.index,
    this.model,
    this.comment,
  }) : super(key: key);

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  @override
  void initState() {
    super.initState();
    controller.getCommentPostById(widget.model?.id ?? 0);
  }

  final controller = Modular.get<OpenController>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<OpenController, HomeState>(
      bloc: controller,
      listener: (context, state) {
        if (state.status == HomeStatus.failure) {
          AsukaSnackbar.alert('Erro ao carregar projetos').show();
        }
      },
      child: Scaffold(
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
              'Post: ${widget.model?.title}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              ' ${widget.model?.body}',
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
            BlocBuilder<OpenController, HomeState>(
              bloc: controller,
              builder: (context, state) {
                return SizedBox(
                  height: 400,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.comment?.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            state.comment?[index].email ?? '',
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic),
                          ),
                          subtitle: Text(
                            state.comment?[index].body ?? '',
                            style: const TextStyle(fontSize: 10),
                          ),
                        );
                      }),
                );
              },
            )
          ])),
        ),
      ),
    );
  }
}
