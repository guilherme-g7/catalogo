import 'dart:convert';

import 'package:catalogomobile/helper/sql/entity.dart';

class CatalogoModel extends Entity{
  String? id;
  String? path;

//<editor-fold desc="Data Methods">

  CatalogoModel({
    this.id,
    this.path,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CatalogoModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          path == other.path);

  @override
  int get hashCode => id.hashCode ^ path.hashCode;

  @override
  String toString() {
    return 'CatalogoPath{' + ' id: $id,' + ' path: $path,' + '}';
  }

  CatalogoModel copyWith({
    String? id,
    String? path,
  }) {
    return CatalogoModel(
      id: id ?? this.id,
      path: path ?? this.path,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'path': this.path,
    };
  }

  factory CatalogoModel.fromJson(Map<String, dynamic> json) {
    return CatalogoModel(
      id: json['id'] as String,
      path: json['path'] as String,
    );
  }

  String toJson() => json.encode(toMap());
//</editor-fold>
}