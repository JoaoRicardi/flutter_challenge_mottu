import 'package:flutter_challenge/src/core/channel/airplane/airplane_method_channel.dart';
import 'package:flutter_challenge/src/core/channel/airplane/airplane_stream_channel.dart';
import 'package:flutter_challenge/src/core/channel/base/base_stream.dart';
import 'package:flutter_challenge/src/core/channel/connectivity/connectivity_stream_channel.dart';
import 'package:mocktail/mocktail.dart';

class AirplaneModeMethodChannelMock extends Mock implements IAirPlaneMethodChannel{}
class AirPlaneStreamChannelMock extends Mock implements BaseStream<AirplaneMode?>{}
class ConnectionStreamChannelMock extends Mock implements BaseStream<Connection?>{}