import 'package:catalogomobile/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/navigation.dart';

class DialogErro {
  static showDialogErro(BuildContext context) {
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
                      Icons.cancel_outlined,
                      size: 100,
                      color: Colors.red,
                    ),
                  ),
                  Center(child: Text('Ocorreram problemas na sincronização dos dados.\n Favor tentar novamente!', style: TextStyle(fontSize: 24), textAlign: TextAlign.center,)),
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
