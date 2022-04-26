import 'package:catalogomobile/features/catalogo/catalogo_api.dart';
import 'package:catalogomobile/features/catalogo/store/catalogo_store.dart';
import 'package:catalogomobile/features/dialogs/dialog_erro.dart';
import 'package:catalogomobile/features/fornecedor/store/fornecedor_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../routes/routes.dart';
import '../../utils/navigation.dart';
import 'catalogo_dao.dart';
import 'catalogo_model.dart';

class CatalogoPage extends StatefulWidget {
  const CatalogoPage({Key? key}) : super(key: key);

  @override
  State<CatalogoPage> createState() => _CatalogoPageState();
}

class _CatalogoPageState extends State<CatalogoPage> {
  final CatalogoDao _catalogoDao = CatalogoDao();
  late CatalogoStore _catalogoStore;
  late FornecedorStore _fornecedorStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _catalogoStore = Provider.of<CatalogoStore>(context);
    _fornecedorStore = Provider.of<FornecedorStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catálogos'),
      ),
      body: Observer(
        builder: (BuildContext context) {
          print(_fornecedorStore.fornecedor);
          return _catalogoStore.isLoading ? Center(child: CircularProgressIndicator()) : FutureBuilder(
            future: CatalogoApi().getCatalogos(_fornecedorStore.fornecedor.id ?? 0),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              switch (snapshot.connectionState) {
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
                  print(snapshot.data);
                  if(snapshot.data != null){
                    List<dynamic> data = snapshot.data;
                    List<CatalogoModel> catalogos = data.map((e) => CatalogoModel.fromJson(e)).toSet().toList();
                    return ListView.builder(
                      itemCount: catalogos.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 24),
                          child: InkWell(
                            onTap: (){
                              _catalogoStore.setPath(catalogos[index].path!);
                              push(context, Routes.visualiza_catalogo);
                            },
                            child: Card(
                              elevation: 5,
                              child: Text(catalogos[index].path ?? '', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                            ),
                          ),
                        );
                      },
                    );
                  } else{
                    return Center(child: Text('Nenhum catálogo encontrado'),);
                  }

                  break;
              }
            },
          );
        },
      ),
    );
  }
}
