import 'dart:convert';

import '../../helper/sql/entity.dart';

class FornecedorModel extends Entity{
  int? id;
  String? nome;
  String? cnpj;
  String? email;
  String? telefone;

//<editor-fold desc="Data Methods">

  FornecedorModel({
    this.id,
    this.nome,
    this.cnpj,
    this.email,
    this.telefone,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FornecedorModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          nome == other.nome &&
          cnpj == other.cnpj &&
          email == other.email &&
          telefone == other.telefone);

  @override
  int get hashCode =>
      id.hashCode ^
      nome.hashCode ^
      cnpj.hashCode ^
      email.hashCode ^
      telefone.hashCode;

  @override
  String toString() {
    return 'FornecedorModel{' +
        ' id: $id,' +
        ' nome: $nome,' +
        ' cnpj: $cnpj,' +
        ' email: $email,' +
        ' telefone: $telefone,' +
        '}';
  }

  FornecedorModel copyWith({
    int? id,
    String? nome,
    String? cnpj,
    String? email,
    String? telefone,
  }) {
    return FornecedorModel(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      cnpj: cnpj ?? this.cnpj,
      email: email ?? this.email,
      telefone: telefone ?? this.telefone,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'nome': this.nome,
      'cnpj': this.cnpj,
      'email': this.email,
      'telefone': this.telefone,
    };
  }

  factory FornecedorModel.fromJson(Map<String, dynamic> json) {
    return FornecedorModel(
      id: json['id'] as int,
      nome: json['nome'] as String,
      cnpj: json['cnpj'] as String,
      email: json['email'] as String,
      telefone: json['telefone'] as String,
    );
  }

  String toJson() => json.encode(toMap());

//</editor-fold>
}