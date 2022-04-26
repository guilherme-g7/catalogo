import 'package:catalogomobile/features/fornecedor/fornecedor_model.dart';

import '../../helper/sql/base_dao.dart';

class FornecedorDao extends BaseDao<FornecedorModel> {
  @override
  FornecedorModel fromMap(Map<String, dynamic> map) {
    return FornecedorModel.fromJson(map);
  }

  @override
  String get tableName => "fornecedor";
}
