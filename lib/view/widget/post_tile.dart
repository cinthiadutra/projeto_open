import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:projeto_open/model/post_model.dart';

class PostTile extends StatelessWidget {
  final PostModel posts;

  const PostTile({Key? key, required this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () async {
          await Modular.to.pushNamed('/project/detail', arguments: posts);
        },
        child: Container(
          constraints: const BoxConstraints(maxHeight: 200),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade300)),
          child: Column(
            children: [
              _ProjectName(postModel: posts),
            ],
          ),
        ));
  }
}

class _ProjectName extends StatelessWidget {
  final PostModel postModel;

  const _ProjectName({required this.postModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(postModel.title),
        ],
      ),
    );
  }
}
