import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:catalogomobile/features/catalogo/store/catalogo_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class VisualizaCatalogoPage extends StatefulWidget {
  const VisualizaCatalogoPage({Key? key}) : super(key: key);

  @override
  State<VisualizaCatalogoPage> createState() => _VisualizaCatalogoPageState();
}

class _VisualizaCatalogoPageState extends State<VisualizaCatalogoPage> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  late CatalogoStore _catalogoStore;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    _catalogoStore = Provider.of<CatalogoStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catálogo'),
      ),
      body: Observer(
        builder: (BuildContext context) {
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Center(
                child: SfPdfViewer.network(
                  _catalogoStore.path,
                  key: _pdfViewerKey,
                  pageLayoutMode: PdfPageLayoutMode.single,
                )
            ),
          );
        },
      ),
    );
  }
}
