// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ConnectionController on _ConnectionController, Store {
  late final _$connectionAuthAtom =
      Atom(name: '_ConnectionController.connectionAuth', context: context);

  @override
  bool get connectionAuth {
    _$connectionAuthAtom.reportRead();
    return super.connectionAuth;
  }

  @override
  set connectionAuth(bool value) {
    _$connectionAuthAtom.reportWrite(value, super.connectionAuth, () {
      super.connectionAuth = value;
    });
  }

  late final _$_ConnectionControllerActionController =
      ActionController(name: '_ConnectionController', context: context);

  @override
  dynamic setAuth(bool value) {
    final _$actionInfo = _$_ConnectionControllerActionController.startAction(
        name: '_ConnectionController.setAuth');
    try {
      return super.setAuth(value);
    } finally {
      _$_ConnectionControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic savePref() {
    final _$actionInfo = _$_ConnectionControllerActionController.startAction(
        name: '_ConnectionController.savePref');
    try {
      return super.savePref();
    } finally {
      _$_ConnectionControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
connectionAuth: ${connectionAuth}
    ''';
  }
}
