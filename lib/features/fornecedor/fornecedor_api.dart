import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../constants/constants_api.dart';

class FornecedorApi{

  getFornocedores() async{
    Response response = await http.get(Uri.parse(ConstantsApi.URL_FORNECEDOR));
    if(response.statusCode == 200){
      var resp = json.decode(utf8.decode(response.bodyBytes));
      return resp;
    }
    return null;
  }
}