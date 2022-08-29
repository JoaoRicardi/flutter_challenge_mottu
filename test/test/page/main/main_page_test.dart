import 'package:flutter/material.dart';
import 'package:flutter_challenge/src/core/channel/airplane/airplane_stream_channel.dart';
import 'package:flutter_challenge/src/core/channel/base/base_stream.dart';
import 'package:flutter_challenge/src/core/channel/connectivity/connectivity_stream_channel.dart';
import 'package:flutter_challenge/src/presentation/modules/main/main_page.dart';
import 'package:flutter_challenge/src/presentation/widgtes/airplane/airplane_mode_floating.dart';
import 'package:flutter_challenge/src/presentation/widgtes/connection/connection_app_bar.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/utils.dart';

main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    TestUtils.setUpAllTests();
  });

  group('Test airplane mode widget', () {
    testWidgets('Main page test with airplane mode enable and on ',
        (WidgetTester tester) async {
      var connectionStream = TestUtils.instanceOf<BaseStream<Connection?>>(
          instanceName: ConnectivityStreamChannel.instanceName);
      var airplaneStream = TestUtils.instanceOf<BaseStream<AirplaneMode?>>(
          instanceName: AirPlaneStreamChannel.instanceName);

      when(() => connectionStream.getStream())
          .thenAnswer((_) => Stream.fromIterable([]));
      when(() => airplaneStream.getStream())
          .thenAnswer((_) => Stream.fromIterable([AirplaneMode.ON]));

      await tester.pumpWidget(
        TestUtils.buildTestableWidget(
          widget: MainPage(),
        ),
      );

      await tester.pump();

      expect(find.byType(ConnectionAppBar), findsOneWidget);
      expect(find.byType(PageView), findsOneWidget);
      expect(find.byType(AirplaneModeFloating), findsOneWidget);
      expect(find.byKey(const Key('airplane_mode_with_value')), findsOneWidget);
      expect(find.byKey(const Key('airplane_mode_empty')), findsNothing);

      expect(find.byIcon(Icons.airplanemode_active), findsOneWidget);
      expect(find.byIcon(Icons.airplanemode_inactive_outlined), findsNothing);
    });

    testWidgets('Main page test with airplane mode enable and off ',
        (WidgetTester tester) async {
      var connectionStream = TestUtils.instanceOf<BaseStream<Connection?>>(
          instanceName: ConnectivityStreamChannel.instanceName);
      var airplaneStream = TestUtils.instanceOf<BaseStream<AirplaneMode?>>(
          instanceName: AirPlaneStreamChannel.instanceName);

      when(() => connectionStream.getStream())
          .thenAnswer((_) => Stream.fromIterable([]));
      when(() => airplaneStream.getStream())
          .thenAnswer((_) => Stream.fromIterable([AirplaneMode.OFF]));

      await tester.pumpWidget(
        TestUtils.buildTestableWidget(
          widget: MainPage(),
        ),
      );

      await tester.pump();

      expect(find.byType(ConnectionAppBar), findsOneWidget);
      expect(find.byType(PageView), findsOneWidget);
      expect(find.byType(AirplaneModeFloating), findsOneWidget);
      expect(find.byKey(const Key('airplane_mode_with_value')), findsOneWidget);
      expect(find.byKey(const Key('airplane_mode_empty')), findsNothing);

      expect(find.byIcon(Icons.airplanemode_active), findsNothing);
      expect(find.byIcon(Icons.airplanemode_inactive_outlined), findsOneWidget);
    });

    testWidgets('Main page test with airplane mode disabled ',
        (WidgetTester tester) async {
      var connectionStream = TestUtils.instanceOf<BaseStream<Connection?>>(
          instanceName: ConnectivityStreamChannel.instanceName);
      var airplaneStream = TestUtils.instanceOf<BaseStream<AirplaneMode?>>(
          instanceName: AirPlaneStreamChannel.instanceName);

      when(() => connectionStream.getStream())
          .thenAnswer((_) => Stream.fromIterable([]));
      when(() => airplaneStream.getStream())
          .thenAnswer((_) => const Stream.empty());

      await tester.pumpWidget(
        TestUtils.buildTestableWidget(
          widget: MainPage(),
        ),
      );

      await tester.pump();

      expect(find.byType(ConnectionAppBar), findsOneWidget);
      expect(find.byType(PageView), findsOneWidget);
      expect(find.byType(AirplaneModeFloating), findsOneWidget);
      expect(find.byKey(const Key('airplane_mode_with_value')), findsNothing);
      expect(find.byKey(const Key('airplane_mode_empty')), findsOneWidget);

      expect(find.byIcon(Icons.airplanemode_active), findsNothing);
      expect(find.byIcon(Icons.airplanemode_inactive_outlined), findsNothing);
    });
  });

  group('Test connection status bar', () {
    testWidgets('Main page test with connection enable and wifi ',
        (WidgetTester tester) async {
      var connectionStream = TestUtils.instanceOf<BaseStream<Connection?>>(
          instanceName: ConnectivityStreamChannel.instanceName);
      var airplaneStream = TestUtils.instanceOf<BaseStream<AirplaneMode?>>(
          instanceName: AirPlaneStreamChannel.instanceName);

      when(() => connectionStream.getStream())
          .thenAnswer((_) => Stream.fromIterable([Connection.cellular]));
      when(() => airplaneStream.getStream())
          .thenAnswer((_) => Stream.fromIterable([]));

      await tester.pumpWidget(
        TestUtils.buildTestableWidget(
          widget: MainPage(),
        ),
      );

      await tester.pump();

      expect(find.byType(ConnectionAppBar), findsOneWidget);
      expect(find.byType(PageView), findsOneWidget);
      expect(find.byType(AirplaneModeFloating), findsOneWidget);
      expect(find.byKey(const Key('connection_with_value')), findsOneWidget);
      expect(find.byKey(const Key('connection_empty')), findsNothing);

      expect(find.text('3g/4g'), findsOneWidget);
    });

    testWidgets('Main page test with connection enable and wifi ',
        (WidgetTester tester) async {
      var connectionStream = TestUtils.instanceOf<BaseStream<Connection?>>(
          instanceName: ConnectivityStreamChannel.instanceName);
      var airplaneStream = TestUtils.instanceOf<BaseStream<AirplaneMode?>>(
          instanceName: AirPlaneStreamChannel.instanceName);

      when(() => connectionStream.getStream())
          .thenAnswer((_) => Stream.fromIterable([Connection.wifi]));
      when(() => airplaneStream.getStream())
          .thenAnswer((_) => Stream.fromIterable([]));

      await tester.pumpWidget(
        TestUtils.buildTestableWidget(
          widget: MainPage(),
        ),
      );

      await tester.pump();

      expect(find.byType(ConnectionAppBar), findsOneWidget);
      expect(find.byType(PageView), findsOneWidget);
      expect(find.byType(AirplaneModeFloating), findsOneWidget);
      expect(find.byKey(const Key('connection_with_value')), findsOneWidget);
      expect(find.byKey(const Key('connection_empty')), findsNothing);

      expect(find.text('Wi-fi'), findsOneWidget);
    });

    testWidgets('Main page test with connection enable and wifi ',
        (WidgetTester tester) async {
      var connectionStream = TestUtils.instanceOf<BaseStream<Connection?>>(
          instanceName: ConnectivityStreamChannel.instanceName);
      var airplaneStream = TestUtils.instanceOf<BaseStream<AirplaneMode?>>(
          instanceName: AirPlaneStreamChannel.instanceName);

      when(() => connectionStream.getStream())
          .thenAnswer((_) => Stream.fromIterable([Connection.disconnected]));
      when(() => airplaneStream.getStream())
          .thenAnswer((_) => Stream.fromIterable([]));

      await tester.pumpWidget(
        TestUtils.buildTestableWidget(
          widget: MainPage(),
        ),
      );

      await tester.pump();

      expect(find.byType(ConnectionAppBar), findsOneWidget);
      expect(find.byType(PageView), findsOneWidget);
      expect(find.byType(AirplaneModeFloating), findsOneWidget);
      expect(find.byKey(const Key('connection_with_value')), findsOneWidget);
      expect(find.byKey(const Key('connection_empty')), findsNothing);

      expect(find.text('Sem conexão'), findsOneWidget);
    });
  });
}
