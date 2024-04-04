import 'package:flutter_modular/flutter_modular.dart';
import 'package:projeto_open/controller/open_controller.dart';
import 'package:projeto_open/controller/open_service.dart';
import 'package:projeto_open/view/home_page.dart';
import 'package:projeto_open/view/post_detail_page.dart';
import 'package:projeto_open/view/splash_page.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.add(OpenController.new);
    i.add(OpenService.new);
  }

  @override
  void routes(r) {
    final args = r.args;
    r.child('/', child: (context) => SplashPage());

    r.child('/home', child: (context) => HomePage());
    r.child('/detail',
        child: (context) => PostDetailPage(
              index: args.data,
            ));
  }

  @override
  void exportedBinds(i) {
    i.add(OpenController.new);
  }
}
