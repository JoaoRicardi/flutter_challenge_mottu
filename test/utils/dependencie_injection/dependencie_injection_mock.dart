import 'package:flutter_challenge/src/core/channel/airplane/airplane_method_channel.dart';
import 'package:flutter_challenge/src/core/channel/airplane/airplane_stream_channel.dart';
import 'package:flutter_challenge/src/core/channel/base/base_stream.dart';
import 'package:flutter_challenge/src/core/navigation/navigation_handler.dart';
import 'package:flutter_challenge/src/core/navigation/navigation_handler_imp.dart';
import 'package:get_it/get_it.dart';

import '../mock/repository/repository_mocks.dart';

class DIMock {

  final GetIt _getIt = GetIt.I;

  registerMocks(){
    _injectPresentationModule();
    _injectCoreModule();
  }

  _injectPresentationModule() {
    // _getIt.registerFactory<ConnectionController>(() => ConnectionController(_getIt.get(instanceName: ConnectivityStreamChannel.instanceName)));
    // _getIt.registerFactory<AirplaneController>(() => AirplaneController(_getIt.get(instanceName: AirPlaneStreamChannel.instanceName)));
    // _getIt.registerFactory<MainController>(() => MainController(
    //     _getIt.get(instanceName: ConnectivityStreamChannel.instanceName),
    //     _getIt.get(instanceName: AirPlaneStreamChannel.instanceName)));
    //
    // _getIt.registerFactory<HomeController>(() => HomeController(
    //   _getIt.get(instanceName: ConnectivityStreamChannel.instanceName),
    //   _getIt.get(instanceName: AirPlaneStreamChannel.instanceName),
    // ));
  }


  _injectCoreModule() {
    _getIt.registerLazySingleton<INavigationHandler>(
            () => NavigationHandlerImp());
    _getIt.registerFactory<IAirPlaneMethodChannel>(() => AirplaneModeMethodChannelMock());
    _getIt.registerLazySingleton<BaseStream>(() => AirPlaneStreamChannel(_getIt.get()),
        instanceName: AirPlaneStreamChannel.instanceName);

    // _getIt.registerLazySingleton<BaseStream>(() => ConnectivityStreamChannel(),
    //     instanceName: ConnectivityStreamChannel.instanceName);
  }


}