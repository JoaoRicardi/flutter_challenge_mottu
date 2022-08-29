import 'package:flutter/material.dart';
import 'package:flutter_challenge/src/core/channel/base/base_stream.dart';
import 'package:flutter_challenge/src/core/channel/connectivity/connectivity_stream_channel.dart';
import 'package:flutter_challenge/src/presentation/modules/connection/connection_page.dart';
import 'package:flutter_challenge/src/presentation/modules/connection/controller/connection_controller.dart';
import 'package:flutter_challenge/src/presentation/widgtes/asset_handler.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils.dart';

main(){

  setUpAll((){
    TestUtils.setUpAllTests();
  });

  testWidgets('Airplane page test with click os switch value', (WidgetTester tester) async {

    PageController pageController = PageController();
    ConnectionController controller = TestUtils.instanceOf();

    BaseStream<Connection?> _connectionStreamHandler = TestUtils.instanceOf(instanceName: ConnectivityStreamChannel.instanceName);

    when(() => _connectionStreamHandler.listenTo())
        .thenAnswer((invocation) => true);

    when(() => _connectionStreamHandler.reset())
        .thenAnswer((invocation) => true);

    await tester.pumpWidget(
      TestUtils.buildTestableWidget(
        widget: ConnectionPage(pageController: pageController),
      ),
    );

    await tester.pump();

    expect(find.byType(MottuAssetHandler), findsOneWidget);
    expect(find.byType(Text), findsNWidgets(4));


    var swicthWidget = find.byKey( const Key('connection_auth_switch'));
    final switchWdt = tester.widget<Switch>(swicthWidget);
    expect(switchWdt.value, false);

    await tester.dragUntilVisible(
        swicthWidget,
        find.byType(SingleChildScrollView),
        const Offset(0, 600) // delta to move
    );

    await controller.changeStatus(true);
    await tester.pump();

    var swicthWidget2 = find.byKey( const Key('connection_auth_switch'));
    final switchWdt2 = tester.widget<Switch>(swicthWidget2);
    expect(switchWdt2.value, true);

  });
}