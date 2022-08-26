// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'battery_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BatteryController on _BatteryController, Store {
  late final _$batteryAuthAtom =
      Atom(name: '_BatteryController.batteryAuth', context: context);

  @override
  bool get batteryAuth {
    _$batteryAuthAtom.reportRead();
    return super.batteryAuth;
  }

  @override
  set batteryAuth(bool value) {
    _$batteryAuthAtom.reportWrite(value, super.batteryAuth, () {
      super.batteryAuth = value;
    });
  }

  late final _$_BatteryControllerActionController =
      ActionController(name: '_BatteryController', context: context);

  @override
  dynamic setAuth(bool value) {
    final _$actionInfo = _$_BatteryControllerActionController.startAction(
        name: '_BatteryController.setAuth');
    try {
      return super.setAuth(value);
    } finally {
      _$_BatteryControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic savePref() {
    final _$actionInfo = _$_BatteryControllerActionController.startAction(
        name: '_BatteryController.savePref');
    try {
      return super.savePref();
    } finally {
      _$_BatteryControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
batteryAuth: ${batteryAuth}
    ''';
  }
}
