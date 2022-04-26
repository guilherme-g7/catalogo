// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalogo_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CatalogoStore on _CatalogoStore, Store {
  final _$pathAtom = Atom(name: '_CatalogoStore.path');

  @override
  String get path {
    _$pathAtom.reportRead();
    return super.path;
  }

  @override
  set path(String value) {
    _$pathAtom.reportWrite(value, super.path, () {
      super.path = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_CatalogoStore.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$_CatalogoStoreActionController =
      ActionController(name: '_CatalogoStore');

  @override
  dynamic setPath(String value) {
    final _$actionInfo = _$_CatalogoStoreActionController.startAction(
        name: '_CatalogoStore.setPath');
    try {
      return super.setPath(value);
    } finally {
      _$_CatalogoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIsLoading() {
    final _$actionInfo = _$_CatalogoStoreActionController.startAction(
        name: '_CatalogoStore.setIsLoading');
    try {
      return super.setIsLoading();
    } finally {
      _$_CatalogoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
path: ${path},
isLoading: ${isLoading}
    ''';
  }
}
