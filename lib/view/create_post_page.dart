import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projeto_open/controller/open_controller.dart';
import 'package:projeto_open/view/widget/appBar_open.dart';
import 'package:projeto_open/view/widget/drawer_open.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

final controller = Modular.get<OpenController>();

class _CreatePostPageState extends State<CreatePostPage> {
  TextEditingController title = TextEditingController();
  TextEditingController body = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: OpenDrawer(),
      appBar: AppBarOpen(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            const Text('Titulo'),
            TextFormField(
              controller: title,
            ),
            const SizedBox(
              height: 30,
            ),
            const Text('Mensagem'),
            TextFormField(
              controller: body,
              maxLines: 4,
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.green)),
                onPressed: () async {
                  await controller
                      .addPost(title: title.text, body: body.text)
                      .whenComplete(
                          () => Navigator.of(context).popAndPushNamed('/home'));
                  Future.delayed(
                    const Duration(seconds: 5),
                  );
                },
                child: const Text(
                  'Criar',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.grey)),
                onPressed: () async {
                  await Navigator.of(context).popAndPushNamed('/home');
                },
                child: const Text(
                  'Voltar',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
