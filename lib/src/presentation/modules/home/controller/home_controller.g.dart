// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeController, Store {
  late final _$isAirplaneEnableAtom =
      Atom(name: '_HomeController.isAirplaneEnable', context: context);

  @override
  bool get isAirplaneEnable {
    _$isAirplaneEnableAtom.reportRead();
    return super.isAirplaneEnable;
  }

  @override
  set isAirplaneEnable(bool value) {
    _$isAirplaneEnableAtom.reportWrite(value, super.isAirplaneEnable, () {
      super.isAirplaneEnable = value;
    });
  }

  late final _$isConnectionEnableAtom =
      Atom(name: '_HomeController.isConnectionEnable', context: context);

  @override
  bool get isConnectionEnable {
    _$isConnectionEnableAtom.reportRead();
    return super.isConnectionEnable;
  }

  @override
  set isConnectionEnable(bool value) {
    _$isConnectionEnableAtom.reportWrite(value, super.isConnectionEnable, () {
      super.isConnectionEnable = value;
    });
  }

  late final _$_HomeControllerActionController =
      ActionController(name: '_HomeController', context: context);

  @override
  dynamic changeAirPlaneStatus(bool value) {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.changeAirPlaneStatus');
    try {
      return super.changeAirPlaneStatus(value);
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeConnectivityStatus(bool value) {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.changeConnectivityStatus');
    try {
      return super.changeConnectivityStatus(value);
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isAirplaneEnable: ${isAirplaneEnable},
isConnectionEnable: ${isConnectionEnable}
    ''';
  }
}
