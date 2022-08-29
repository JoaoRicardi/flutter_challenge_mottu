import 'package:flutter/services.dart';
import 'package:flutter_challenge/src/core/channel/airplane/airplane_method_channel.dart';
import 'package:flutter_challenge/src/core/channel/airplane/airplane_stream_channel.dart';
import 'package:flutter_challenge/src/core/channel/base/base_stream.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/mock/repository/repository_mocks.dart';
import '../../../../utils/utils.dart';

void main() {
  const _channel = EventChannel("flutter_challenge/airplaneMode");

  IAirPlaneMethodChannel methodChannel = AirplaneModeMethodChannelMock();

  late BaseStream<AirplaneMode?> streamChannel;

  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    TestUtils.setUpAllTests();
  });

  group('Test airplane mode streaming imp', () {
    testWidgets('Test airplane mode setting to online',
        (WidgetTester tester) async {
      when(() => methodChannel.startListeningToAirPlaneStatus())
          .thenAnswer((invocation) async => true);

      tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
          MethodChannel(_channel.name), (MethodCall methodCall) async {
        if (methodCall.method == 'listen') {
          await ServicesBinding.instance?.defaultBinaryMessenger
              .handlePlatformMessage(_channel.name,
                  _channel.codec.encodeSuccessEnvelope(true), (_) {});
        }

        return null;
      });

      streamChannel = AirPlaneStreamChannel(methodChannel);

      var res = await _channel.receiveBroadcastStream().first;

      await streamChannel.listenTo();

      expect(res, true);

      expect(streamChannel.getStream(), emitsInOrder([AirplaneMode.on]));
    });

    testWidgets('Test airplane mode setting to offline',
        (WidgetTester tester) async {
      when(() => methodChannel.startListeningToAirPlaneStatus())
          .thenAnswer((invocation) async => true);

      tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
          MethodChannel(_channel.name), (MethodCall methodCall) async {
        if (methodCall.method == 'listen') {
          await ServicesBinding.instance?.defaultBinaryMessenger
              .handlePlatformMessage(_channel.name,
                  _channel.codec.encodeSuccessEnvelope(false), (_) {});
        }

        return null;
      });

      streamChannel = AirPlaneStreamChannel(methodChannel);

      var res = await _channel.receiveBroadcastStream().first;

      await streamChannel.listenTo();

      expect(res, false);

      expect(streamChannel.getStream(), emitsInOrder([AirplaneMode.off]));
    });

    testWidgets('Test airplane mode setting to desconhecido',
        (WidgetTester tester) async {
      when(() => methodChannel.startListeningToAirPlaneStatus())
          .thenAnswer((invocation) async => true);

      tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
          MethodChannel(_channel.name), (MethodCall methodCall) async {
        if (methodCall.method == 'listen') {
          await ServicesBinding.instance?.defaultBinaryMessenger
              .handlePlatformMessage(_channel.name,
                  _channel.codec.encodeSuccessEnvelope("Unknow"), (_) {});
        } else {
          return null;
        }
      });

      streamChannel = AirPlaneStreamChannel(methodChannel);

      var res = await _channel.receiveBroadcastStream().first;

      await streamChannel.listenTo();

      expect(res, "Unknow");

      expect(
          streamChannel.getStream(), emitsInOrder([AirplaneMode.desconhecido]));
    });
  });
}
