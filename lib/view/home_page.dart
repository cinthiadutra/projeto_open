import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projeto_open/controller/open_controller.dart';
import 'package:projeto_open/controller/open_status.dart';
import 'package:projeto_open/view/post_detail_page.dart';
import 'package:projeto_open/view/widget/drawer_open.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key}) : super();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final OpenController controller = Modular.get<OpenController>();
  @override
  void initState() {
    super.initState();
    controller.getAllPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: OpenDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.asset(
          "assets/images/openLogo.png",
          scale: 3.0,
        ),
        elevation: 3.0,
        centerTitle: true,
      ),
      body: BlocBuilder<OpenController, HomeState>(
        bloc: controller,
        builder: (context, state) {
          if (state.status == HomeStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.status == HomeStatus.loaded ||
              state.status == HomeStatus.initial) {
            return ListView.builder(
              itemCount: controller.listaPostagens.length,
              itemBuilder: (context, index) {
                final post = controller.listaPostagens[index];
                final posts = state.post?[index];
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    elevation: 0.5,
                    child: ListTile(
                      trailing: const Icon(
                        Icons.arrow_right_outlined,
                        size: 20,
                      ),
                      title: Text(
                        post.title,
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        post.body,
                        style: const TextStyle(fontSize: 10),
                      ),
                      onTap: () {
                        controller
                            .getCommentPostById(state.post?[index].id ?? 0);
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PostDetailPage(
                            model: posts,
                            index: state.post?[index].id ?? 0,
                            comment: controller.listacomments,
                          ),
                        ));
                      },
                    ),
                  ),
                );
              },
            );
          } else if (state.status == HomeStatus.failure) {
            return const Center(
              child: Text('Erro ao carregar os posts'),
            );
          }
          return const Center(
            child: Text('Nenhum post encontrado'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          controller.getAllPosts();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
