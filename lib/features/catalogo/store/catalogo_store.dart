import 'package:mobx/mobx.dart';

// Include generated file
part 'catalogo_store.g.dart';

// This is the class used by rest of your codebase
class CatalogoStore = _CatalogoStore with _$CatalogoStore;

// The store-class
abstract class _CatalogoStore with Store {
  @observable
  String path = '';

  @observable
  bool isLoading = false;

  @action
  setPath(String value) => path = value;

  @action
  setIsLoading() => isLoading = !isLoading;
}