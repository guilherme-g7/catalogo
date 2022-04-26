import 'package:catalogomobile/features/dialogs/dialog_sincronizar.dart';
import 'package:catalogomobile/features/fornecedor/fornecedor_controller.dart';
import 'package:catalogomobile/features/fornecedor/fornecedor_page.dart';
import 'package:catalogomobile/utils/navigation.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../routes/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            push(context, Routes.visualiza_catalogo);
          }, child: Text('Tela 2'))
        ],
      ),
    );
  }
}
