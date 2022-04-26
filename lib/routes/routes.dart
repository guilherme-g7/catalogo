import 'package:catalogomobile/features/fornecedor/fornecedor_page.dart';
import 'package:catalogomobile/features/visualiza_catalogo/visualiza_catalogo_page.dart';
import 'package:flutter/cupertino.dart';

import '../features/catalogo/catalogo_page.dart';
import '../features/home_page/home_page.dart';

class Routes{

  static const initial = '/';
  static const home = '/home';
  static const visualiza_catalogo = '/visualiza_catalogo';
  static const fornecedores = '/fornecedores';
  static const catalogos = '/catalogos';

  static Map<String, Widget Function(BuildContext)> routes = {
    home: (BuildContext context) => HomePage(),
    visualiza_catalogo: (BuildContext context) => VisualizaCatalogoPage(),
    fornecedores: (BuildContext context) => FornecedorPage(),
    catalogos: (BuildContext context) => CatalogoPage()
  };

}