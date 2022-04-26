
import '../../helper/sql/base_dao.dart';
import 'catalogo_model.dart';

class CatalogoDao extends BaseDao<CatalogoModel> {
  @override
  CatalogoModel fromMap(Map<String, dynamic> map) {
    return CatalogoModel.fromJson(map);
  }

  @override
  String get tableName => "catalogo";
}
