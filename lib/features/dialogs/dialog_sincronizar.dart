import 'package:catalogomobile/features/dialogs/dialog_erro.dart';
import 'package:catalogomobile/features/dialogs/dialog_sucesso.dart';
import 'package:catalogomobile/features/fornecedor/fornecedor_controller.dart';
import 'package:flutter/material.dart';

import '../../utils/navigation.dart';

class DialogSincronizar {
  static showDialogSincronizar(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            width:
            MediaQuery.of(context).orientation == Orientation.landscape
                ? MediaQuery.of(context).size.width * 0.3
                : MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.height * 0.3,
            child: FutureBuilder(
              future: FornecedorController().getFornecedores(context),
              builder:
                  (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return Container();
                    break;
                  case ConnectionState.waiting:
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          SizedBox(height: 50),
                          SizedBox(
                            child: CircularProgressIndicator(),
                            height: 100,
                            width: 100,
                          ),
                          SizedBox(height: 50),
                          Text('Sincronizando, por favor aguarde...', style: TextStyle(fontSize: 24),)
                        ],
                      ),
                    );
                    break;
                  case ConnectionState.active:
                    return Container();
                    break;
                  case ConnectionState.done:
                    print("${snapshot.data} ------------- errro snap");
                    if(snapshot.data != null){
                      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
                        DialogSucesso.showDialogSucesso(context);
                      });
                    } else {
                      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
                        DialogErro.showDialogErro(context);
                      });
                    }
                    return Container();
                    break;
                }
              },
            ),
          ),
        );


      },
    );
  }
}
