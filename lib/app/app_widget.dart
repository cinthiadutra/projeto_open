import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projeto_open/app/core/ui/app.config.ui.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      builder: Asuka.builder,
      title: '',
      theme: AppConfigUi.themeData,
      routerConfig: Modular.routerConfig,
    );
  }
}
