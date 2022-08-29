import 'package:flutter/services.dart';
import 'package:flutter_challenge/src/core/channel/base/base_stream.dart';
import 'package:flutter_challenge/src/core/channel/connectivity/connectivity_stream_channel.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../../utils/utils.dart';

void main() {
  const _channel = EventChannel('flutter_challenge/connectivity');

  late BaseStream<Connection?> streamChannel;

  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    TestUtils.setUpAllTests();
  });

  group('Test connectivity streaming imp', () {
    testWidgets('Test connectivity with wifi', (WidgetTester tester) async {
      streamChannel = ConnectivityStreamChannel();
      tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
          MethodChannel(_channel.name), (MethodCall methodCall) async {
        if (methodCall.method == 'listen') {
          await ServicesBinding.instance?.defaultBinaryMessenger
              .handlePlatformMessage(_channel.name,
                  _channel.codec.encodeSuccessEnvelope(0xFF), (_) {});
        }
        return null;
      });

      var res = await _channel.receiveBroadcastStream().first;

      await streamChannel.listenTo();

      expect(res, 0xFF);
      expect(streamChannel.getStream(), emitsInOrder([Connection.wifi]));
    });

    testWidgets('Test connectivity with 3g/4g', (WidgetTester tester) async {
      streamChannel = ConnectivityStreamChannel();
      tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
          MethodChannel(_channel.name), (MethodCall methodCall) async {
        if (methodCall.method == 'listen') {
          await ServicesBinding.instance?.defaultBinaryMessenger
              .handlePlatformMessage(_channel.name,
                  _channel.codec.encodeSuccessEnvelope(0xEE), (_) {});
        }
        return null;
      });

      var res = await _channel.receiveBroadcastStream().first;

      await streamChannel.listenTo();

      expect(res, 0xEE);
      expect(streamChannel.getStream(), emitsInOrder([Connection.cellular]));
    });

    testWidgets('Test connectivity with without connection',
        (WidgetTester tester) async {
      streamChannel = ConnectivityStreamChannel();
      tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
          MethodChannel(_channel.name), (MethodCall methodCall) async {
        if (methodCall.method == 'listen') {
          await ServicesBinding.instance?.defaultBinaryMessenger
              .handlePlatformMessage(_channel.name,
                  _channel.codec.encodeSuccessEnvelope(0xDD), (_) {});
        }
        return null;
      });

      var res = await _channel.receiveBroadcastStream().first;

      await streamChannel.listenTo();

      expect(res, 0xDD);
      expect(
          streamChannel.getStream(), emitsInOrder([Connection.disconnected]));
    });

    testWidgets('Test connectivity with unknow', (WidgetTester tester) async {
      streamChannel = ConnectivityStreamChannel();
      tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
          MethodChannel(_channel.name), (MethodCall methodCall) async {
        if (methodCall.method == 'listen') {
          await ServicesBinding.instance?.defaultBinaryMessenger
              .handlePlatformMessage(_channel.name,
                  _channel.codec.encodeSuccessEnvelope(0xCC), (_) {});
        }
        return null;
      });

      var res = await _channel.receiveBroadcastStream().first;

      await streamChannel.listenTo();

      expect(res, 0xCC);
      expect(streamChannel.getStream(), emitsInOrder([Connection.unknown]));
    });
  });

  group('Test connectivity streaming stop', () {
    testWidgets('Test connectivity streming while stoping',
        (WidgetTester tester) async {
      streamChannel = ConnectivityStreamChannel();
      await streamChannel.reset();
      expect(streamChannel.getStream(), emitsInOrder([null]));
    });
  });
}
