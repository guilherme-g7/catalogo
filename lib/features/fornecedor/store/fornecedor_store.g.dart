// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fornecedor_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FornecedorStore on _FornecedorStore, Store {
  final _$fornecedorAtom = Atom(name: '_FornecedorStore.fornecedor');

  @override
  FornecedorModel get fornecedor {
    _$fornecedorAtom.reportRead();
    return super.fornecedor;
  }

  @override
  set fornecedor(FornecedorModel value) {
    _$fornecedorAtom.reportWrite(value, super.fornecedor, () {
      super.fornecedor = value;
    });
  }

  final _$_FornecedorStoreActionController =
      ActionController(name: '_FornecedorStore');

  @override
  dynamic setFornecedor(FornecedorModel value) {
    final _$actionInfo = _$_FornecedorStoreActionController.startAction(
        name: '_FornecedorStore.setFornecedor');
    try {
      return super.setFornecedor(value);
    } finally {
      _$_FornecedorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
fornecedor: ${fornecedor}
    ''';
  }
}
