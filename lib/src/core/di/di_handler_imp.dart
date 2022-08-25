import 'package:flutter_challenge/src/core/channel/connectivity_channel.dart';
import 'package:flutter_challenge/src/core/di/di_handler.dart';
import 'package:flutter_challenge/src/core/navigation/navigation_handler.dart';
import 'package:flutter_challenge/src/core/navigation/navigation_handler_imp.dart';
import 'package:get_it/get_it.dart';
/// classe para lidar com a injecao de dependecias
/// gerenciar como criamos/instanciamos uma classe

class DIHandlerImp implements IDIHandler {

  final _getIt = GetIt.I;

  @override
  init() {
    _getIt.registerLazySingleton<ConnectivityEventChannel>(() => ConnectivityEventChannel());
    _getIt.registerLazySingleton<INavigationHandler>(() => NavigationHandlerImp());
  }


  @override
  T get<T extends Object>() {
    return _getIt.get<T>();
  }

}