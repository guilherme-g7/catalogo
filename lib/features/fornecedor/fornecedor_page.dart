import 'package:catalogomobile/features/fornecedor/fornecedor_dao.dart';
import 'package:catalogomobile/features/fornecedor/fornecedor_model.dart';
import 'package:catalogomobile/features/fornecedor/store/fornecedor_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../routes/routes.dart';
import '../../utils/navigation.dart';
import '../dialogs/dialog_sincronizar.dart';

class FornecedorPage extends StatefulWidget {
  const FornecedorPage({Key? key}) : super(key: key);

  @override
  State<FornecedorPage> createState() => _FornecedorPageState();
}

class _FornecedorPageState extends State<FornecedorPage> {
  final FornecedorDao _fornecedorDao = FornecedorDao();

  late FornecedorStore _fornecedorStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _fornecedorStore = Provider.of<FornecedorStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.green,
                    Colors.green.shade200,
                  ],
                ),
              ),
              child: const Text(
                'Donna da Beleza',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.sync),
              title: Text('Sincronizar'),
              onTap: () {
                DialogSincronizar.showDialogSincronizar(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Fornecedores'),
      ),
      body: FutureBuilder(
        future: _fornecedorDao.findAll(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          switch(snapshot.connectionState){
            case ConnectionState.none:
              return Container();
              break;
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
              break;
            case ConnectionState.active:
              return Container();
              break;
            case ConnectionState.done:
              List<FornecedorModel> fornecedores = snapshot.data;
              return ListView.builder(
                itemCount: fornecedores.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 24),
                    child: InkWell(
                      onTap: (){
                        _fornecedorStore.setFornecedor(fornecedores[index]);
                        push(context, Routes.catalogos);
                      },
                      child: Card(
                        elevation: 5,
                        child: ListTile(
                          title: Text(fornecedores[index].nome!, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 6.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(fornecedores[index].cnpj!, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                                SizedBox(height: 2),
                                Text(fornecedores[index].email!),
                                SizedBox(height: 4),
                                Text(fornecedores[index].telefone!),
                              ],
                            ),
                          ),
                          trailing: Icon(Icons.navigate_next_outlined),
                        ),
                      ),
                    ),
                  );
                },
              );
              break;
          }
        },
      ),
    );
  }
}
