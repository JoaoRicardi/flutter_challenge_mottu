import 'package:flutter_challenge/src/core/channel/airplane/airplane_method_channel.dart';
import 'package:flutter_challenge/src/core/channel/airplane/airplane_stream_channel.dart';
import 'package:flutter_challenge/src/core/channel/base/base_stream.dart';
import 'package:flutter_challenge/src/core/channel/connectivity/connectivity_channel.dart';
import 'package:flutter_challenge/src/core/di/di_handler.dart';
import 'package:flutter_challenge/src/core/navigation/navigation_handler.dart';
import 'package:flutter_challenge/src/core/navigation/navigation_handler_imp.dart';
import 'package:flutter_challenge/src/presentation/modules/airplane/controller/airplane_controller.dart';
import 'package:flutter_challenge/src/presentation/modules/connection/controller/connection_controller.dart';
import 'package:flutter_challenge/src/presentation/modules/home/controller/home_controller.dart';
import 'package:flutter_challenge/src/presentation/modules/main/controller/main_controller.dart';
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

  _injectPresentationModule() {
    _getIt.registerFactory<ConnectionController>(() => ConnectionController(_getIt.get(instanceName: ConnectivityStreamChannel.instanceName)));
    _getIt.registerFactory<AirplaneController>(() => AirplaneController(_getIt.get(instanceName: AirPlaneStreamChannel.instanceName)));
    _getIt.registerFactory<MainController>(() => MainController(
        _getIt.get(instanceName: ConnectivityStreamChannel.instanceName),
        _getIt.get(instanceName: AirPlaneStreamChannel.instanceName)));

    _getIt.registerFactory<HomeController>(() => HomeController(
        _getIt.get(instanceName: ConnectivityStreamChannel.instanceName),
        _getIt.get(instanceName: AirPlaneStreamChannel.instanceName),
    ));
  }

  _injectDomainModule() {}

  _injectCoreModule() {
    _getIt.registerLazySingleton<INavigationHandler>(
        () => NavigationHandlerImp());

    _getIt
        .registerFactory<IAirPlaneMethodChannel>(() => AirPlaneMethodChannel());
    _getIt.registerLazySingleton<BaseStream>(() => ConnectivityStreamChannel(),
        instanceName: ConnectivityStreamChannel.instanceName);
    _getIt.registerLazySingleton<BaseStream>(() => AirPlaneStreamChannel(_getIt.get()),
        instanceName: AirPlaneStreamChannel.instanceName);
  }

  @override
  T get<T extends Object>() {
    return _getIt.get<T>();
  }
}
