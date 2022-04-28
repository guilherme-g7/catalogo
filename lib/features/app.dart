import 'package:catalogomobile/features/catalogo/store/catalogo_store.dart';
import 'package:catalogomobile/features/fornecedor/fornecedor_page.dart';
import 'package:catalogomobile/features/fornecedor/store/fornecedor_store.dart';
import 'package:catalogomobile/features/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import '../routes/routes.dart';

class DonnaDaBelezaApp extends StatelessWidget {
  DonnaDaBelezaApp({Key? key}) : super(key: key);

  final CatalogoStore _catalogoStore = CatalogoStore();
  final FornecedorStore _fornecedorStore = FornecedorStore();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<CatalogoStore>(create: (_) => _catalogoStore),
        Provider<FornecedorStore>(create: (_) => _fornecedorStore),
      ],
      child: MaterialApp(
        builder: (context, widget) => ResponsiveWrapper.builder(
            BouncingScrollWrapper.builder(context, widget!),
            maxWidth: double.maxFinite,
            minWidth: 450,
            defaultScale: true,
            breakpoints: [
              const ResponsiveBreakpoint.resize(450, name: MOBILE),
              const ResponsiveBreakpoint.autoScale(800, name: TABLET),
              const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
              const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
              const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
            ],
            background: Container(color:  Colors.grey.shade300)),
        initialRoute: Routes.initial,
        routes: Routes.routes,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Colors.green.shade300
          )
        ),
        home: FornecedorPage(),
      ),
    );
  }
}

