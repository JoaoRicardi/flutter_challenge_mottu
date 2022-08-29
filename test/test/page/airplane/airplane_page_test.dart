import 'package:flutter/material.dart';
import 'package:flutter_challenge/src/core/channel/airplane/airplane_stream_channel.dart';
import 'package:flutter_challenge/src/core/channel/base/base_stream.dart';
import 'package:flutter_challenge/src/presentation/modules/airplane/airplane_page.dart';
import 'package:flutter_challenge/src/presentation/modules/airplane/controller/airplane_controller.dart';
import 'package:flutter_challenge/src/presentation/widgtes/asset_handler.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/utils.dart';

main() {
  setUpAll(() {
    TestUtils.setUpAllTests();
  });

  testWidgets('Airplane page test with click os switch value',
      (WidgetTester tester) async {
    PageController pageController = PageController();
    AirplaneController controller = TestUtils.instanceOf();

    BaseStream<AirplaneMode?> _airplaneStreamHandler =
        TestUtils.instanceOf(instanceName: AirPlaneStreamChannel.instanceName);

    when(() => _airplaneStreamHandler.listenTo())
        .thenAnswer((invocation) => true);

    when(() => _airplaneStreamHandler.reset()).thenAnswer((invocation) => true);

    await tester.pumpWidget(
      TestUtils.buildTestableWidget(
        widget: AirplanePage(pageController: pageController),
      ),
    );

    await tester.pump();

    expect(find.byType(MottuAssetHandler), findsOneWidget);
    expect(find.byType(Text), findsNWidgets(4));

    var swicthWidget = find.byKey(const Key('airplane_auth_switch'));
    final switchWdt = tester.widget<Switch>(swicthWidget);
    expect(switchWdt.value, false);

    await tester.dragUntilVisible(
        swicthWidget,
        find.byType(SingleChildScrollView),
        const Offset(0, 600) // delta to move
        );

    await controller.changeStatus(true);
    await tester.pump();

    var swicthWidget2 = find.byKey(const Key('airplane_auth_switch'));
    final switchWdt2 = tester.widget<Switch>(swicthWidget2);
    expect(switchWdt2.value, true);
  });
}
