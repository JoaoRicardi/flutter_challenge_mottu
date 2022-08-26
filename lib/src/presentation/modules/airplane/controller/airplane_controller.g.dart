// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'airplane_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AirplaneController on _AirplaneController, Store {
  late final _$airplaneAuthAtom =
      Atom(name: '_AirplaneController.airplaneAuth', context: context);

  @override
  bool get airplaneAuth {
    _$airplaneAuthAtom.reportRead();
    return super.airplaneAuth;
  }

  @override
  set airplaneAuth(bool value) {
    _$airplaneAuthAtom.reportWrite(value, super.airplaneAuth, () {
      super.airplaneAuth = value;
    });
  }

  late final _$_AirplaneControllerActionController =
      ActionController(name: '_AirplaneController', context: context);

  @override
  dynamic setAuth(bool value) {
    final _$actionInfo = _$_AirplaneControllerActionController.startAction(
        name: '_AirplaneController.setAuth');
    try {
      return super.setAuth(value);
    } finally {
      _$_AirplaneControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic savePref() {
    final _$actionInfo = _$_AirplaneControllerActionController.startAction(
        name: '_AirplaneController.savePref');
    try {
      return super.savePref();
    } finally {
      _$_AirplaneControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
airplaneAuth: ${airplaneAuth}
    ''';
  }
}
