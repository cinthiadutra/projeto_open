import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OpenDrawer extends Drawer {
  OpenDrawer({super.key})
      : super(
          surfaceTintColor: Colors.green,
          shadowColor: Colors.green,
          backgroundColor: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const ListTile(
                title: Text(
                  'Cinthia Dutra',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.green),
                ),
                leading: Icon(
                  Icons.person,
                  color: Colors.grey,
                ),
              ),
              const ListTile(
                title: Text(
                  'cinthiadutra@gmail.com',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.green),
                ),
                leading: Icon(
                  Icons.email,
                  color: Colors.grey,
                ),
              ),
              const ListTile(
                title: Text(
                  '(21)99900-5171',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.green),
                ),
                leading: Icon(
                  Icons.phone,
                  color: Colors.grey,
                ),
              ),
              InkWell(
                onTap: () {
                  Modular.to.pushReplacementNamed('/');
                },
                child: const ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: Colors.grey,
                  ),
                  title: Text(
                    'Sair',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              )
            ],
          ),
        );
}
