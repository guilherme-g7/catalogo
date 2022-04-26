import 'dart:convert';

import 'package:catalogomobile/constants/constants_api.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class CatalogoApi{

  getCatalogos(int id) async{
    Response response = await http.get(Uri.parse(ConstantsApi.URL_CATALOGO + '?id=$id'));

    if(response.statusCode == 200){
      var resp = json.decode(utf8.decode(response.bodyBytes));
      return resp;
    }
    return null;
  }
}