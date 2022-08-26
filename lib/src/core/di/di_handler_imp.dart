import 'package:flutter_challenge/src/core/channel/connectivity_channel.dart';
import 'package:flutter_challenge/src/core/di/di_handler.dart';
import 'package:flutter_challenge/src/core/local_storage/local_storage.dart';
import 'package:flutter_challenge/src/core/local_storage/local_storage_imp.dart';
import 'package:flutter_challenge/src/core/navigation/navigation_handler.dart';
import 'package:flutter_challenge/src/core/navigation/navigation_handler_imp.dart';
import 'package:flutter_challenge/src/data/repository/pref/pref_repository.dart';
import 'package:flutter_challenge/src/domain/repository/prefs/pref_repository.dart';
import 'package:flutter_challenge/src/presentation/modules/connection/controller/connection_controller.dart';
import 'package:get_it/get_it.dart';
/// classe para lidar com a injecao de dependecias
/// gerenciar como criamos/instanciamos uma classe

class DIHandlerImp implements IDIHandler {

  final _getIt = GetIt.I;

  @override
  init() {
    _injectCoreModule();
    _injectDomainModule();
    _injectPresentationModule();
  }

  _injectPresentationModule(){
    _getIt.registerFactory<ConnectionController>(() => ConnectionController(_getIt()));
  }

  _injectDomainModule(){
    _getIt.registerFactory<IPrefRepository>(() => PrefRepositoryImp(_getIt()));
  }

  _injectCoreModule(){
    _getIt.registerLazySingleton<INavigationHandler>(() => NavigationHandlerImp());
    _getIt.registerFactory<ILocalStorage>(() => LocalStorageImp());


    _getIt.registerLazySingleton<ConnectivityEventChannel>(() => ConnectivityEventChannel());
  }


  @override
  T get<T extends Object>() {
    return _getIt.get<T>();
  }

}