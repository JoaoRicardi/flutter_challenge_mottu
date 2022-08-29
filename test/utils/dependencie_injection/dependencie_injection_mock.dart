import 'package:flutter_challenge/src/core/channel/airplane/airplane_method_channel.dart';
import 'package:flutter_challenge/src/core/channel/airplane/airplane_stream_channel.dart';
import 'package:flutter_challenge/src/core/channel/base/base_stream.dart';
import 'package:flutter_challenge/src/core/channel/connectivity/connectivity_stream_channel.dart';
import 'package:flutter_challenge/src/core/navigation/navigation_handler.dart';
import 'package:flutter_challenge/src/core/navigation/navigation_handler_imp.dart';
import 'package:flutter_challenge/src/presentation/modules/airplane/controller/airplane_controller.dart';
import 'package:flutter_challenge/src/presentation/modules/connection/controller/connection_controller.dart';
import 'package:flutter_challenge/src/presentation/modules/main/controller/main_controller.dart';
import 'package:get_it/get_it.dart';

import '../mock/repository/repository_mocks.dart';

class DIMock {
  final GetIt getIt = GetIt.I;

  registerMocks() {
    _injectCoreModule();
    _injectPresentationModule();
  }

  _injectPresentationModule() {
    getIt.registerLazySingleton<ConnectionController>(() =>
        ConnectionController(
            getIt.get(instanceName: ConnectivityStreamChannel.instanceName)));
    getIt.registerLazySingleton<AirplaneController>(() => AirplaneController(
        getIt.get(instanceName: AirPlaneStreamChannel.instanceName)));
    getIt.registerFactory<MainController>(() => MainController(
        getIt.get(instanceName: ConnectivityStreamChannel.instanceName),
        getIt.get(instanceName: AirPlaneStreamChannel.instanceName)));
  }

  _injectCoreModule() {
    getIt.registerLazySingleton<INavigationHandler>(
        () => NavigationHandlerImp());
    getIt.registerLazySingleton<IAirPlaneMethodChannel>(
        () => AirplaneModeMethodChannelMock());
    getIt.registerLazySingleton<BaseStream<AirplaneMode?>>(
        () => AirPlaneStreamChannelMock(),
        instanceName: AirPlaneStreamChannel.instanceName);

    getIt.registerLazySingleton<BaseStream<Connection?>>(
        () => ConnectionStreamChannelMock(),
        instanceName: ConnectivityStreamChannel.instanceName);
  }
}
