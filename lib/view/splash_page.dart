import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projeto_open/controller/open_controller.dart';
import 'package:projeto_open/view/home_page.dart';

class SplashPage extends StatelessWidget {
  SplashPage({super.key});
  final controller = Modular.get<OpenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "assets/images/openLogo.png",
              scale: 2.0,
            ),
          ),
          ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.green)),
              onPressed: () async {
                await controller.getAllPosts().whenComplete(
                        await Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    )));
                if (controller.listaPostagens.isEmpty) {
                  controller.getAllPosts();
                }
              },
              child: const Text('Entrar'))
        ],
      ),
    );
  }
}
