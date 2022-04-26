import 'package:catalogomobile/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/navigation.dart';

class DialogSucesso {
  static showDialogSucesso(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              width: MediaQuery.of(context).orientation == Orientation.landscape
                  ? MediaQuery.of(context).size.width * 0.3
                  : MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Icon(
                      Icons.check,
                      size: 100,
                      color: Colors.green,
                    ),
                  ),
                  Center(child: Text('Sincronização realizada com sucesso!', style: TextStyle(fontSize: 24),)),
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    push(context, Routes.fornecedores, removeUntil: true);
                  },
                  child: Text('OK'))
            ],
          );
        });
  }
}
