import 'package:catalogomobile/features/fornecedor/fornecedor_api.dart';
import 'package:catalogomobile/features/fornecedor/fornecedor_dao.dart';
import 'package:catalogomobile/features/fornecedor/fornecedor_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';

import '../../helper/sql/db_helper.dart';
import '../catalogo/catalogo_dao.dart';
import '../dialogs/dialog_erro.dart';

class FornecedorController{
  final FornecedorApi _fornecedorApi = FornecedorApi();
  final FornecedorDao _fornecedorDao = FornecedorDao();
  final CatalogoDao _catalogoDao = CatalogoDao();

  Future<Database?> get db => DatabaseHelper.getInstance().db;


  getFornecedores(BuildContext context) async{
    try{
        await _fornecedorDao.deleteAll();
        await _catalogoDao.deleteAll();

        var retorno = await _fornecedorApi.getFornocedores();

        if(retorno != null) {
          for (var fornecedor in retorno) {
            FornecedorModel newFornecedor = FornecedorModel(
              id: fornecedor['id'],
              nome: fornecedor['nome'],
              cnpj: fornecedor['cnpj'],
              email: fornecedor['email'],
              telefone: fornecedor['telefone'],
            );
            await _fornecedorDao.save(newFornecedor);
          }
          return retorno;
        }
        return null;
    } catch (e){
      print(e);
      DialogErro.showDialogErro(context);
    }


  }

}