import 'package:catalogomobile/features/fornecedor/fornecedor_model.dart';
import 'package:mobx/mobx.dart';

// Include generated file
part 'fornecedor_store.g.dart';

// This is the class used by rest of your codebase
class FornecedorStore = _FornecedorStore with _$FornecedorStore;

// The store-class
abstract class _FornecedorStore with Store {
  @observable
  FornecedorModel fornecedor = FornecedorModel();

  @action
  setFornecedor(FornecedorModel value) => fornecedor = value;
}