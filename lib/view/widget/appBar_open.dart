// ignore_for_file: file_names

import 'package:flutter/material.dart';

class AppBarOpen extends AppBar {
  AppBarOpen({super.key})
      : super(
            leading: const Icon(
              Icons.menu,
              color: Colors.green,
            ),
            centerTitle: true,
            backgroundColor: Colors.black,
            iconTheme: const IconThemeData(color: Colors.green),
            title: Image.asset(
              "assets/images/openLogo.png",
              scale: 3.0,
            ),
            foregroundColor: Colors.green);
}
