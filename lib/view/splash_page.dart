import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projeto_open/controller/open_controller.dart';
import 'package:projeto_open/view/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final controller = Modular.get<OpenController>();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1)).then((value) {
      Navigator.of(context).pushReplacementNamed('/home');
    });
  }

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

          const Center(child: CircularProgressIndicator.adaptive()),
          // ElevatedButton(
          //     style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.green)),
          //     onPressed: () async {
          //       await controller.getAllPosts().whenComplete(await Navigator.of(context).push(MaterialPageRoute(
          //             builder: (context) => const HomePage(),
          //           )));
          //       if (controller.listaPostagens.isEmpty) {
          //         controller.getAllPosts();
          //       }
          //     },
          //     child: const Text('Entrar'))
        ],
      ),
    );
  }
}
