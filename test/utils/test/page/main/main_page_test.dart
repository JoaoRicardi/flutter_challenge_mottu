import 'package:flutter/material.dart';
import 'package:flutter_challenge/src/core/channel/airplane/airplane_stream_channel.dart';
import 'package:flutter_challenge/src/core/channel/base/base_stream.dart';
import 'package:flutter_challenge/src/core/channel/connectivity/connectivity_stream_channel.dart';
import 'package:flutter_challenge/src/presentation/modules/main/controller/main_controller.dart';
import 'package:flutter_challenge/src/presentation/modules/main/main_page.dart';
import 'package:flutter_challenge/src/presentation/widgtes/airplane/airplane_mode_floating.dart';
import 'package:flutter_challenge/src/presentation/widgtes/connection/connection_app_bar.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../utils.dart';

main(){
  setUpAll((){
    TestUtils.setUpAllTests();
  });

  var mainController = TestUtils.instanceOf<MainController>();
  BaseStream<Connection?> connectionStream =  TestUtils.instanceOf();
  BaseStream<AirplaneMode?> airplaneStream =  TestUtils.instanceOf();

  testWidgets('Main page test with airplane mode enable and on ', (WidgetTester tester) async {

    await tester.pumpWidget(
      TestUtils.buildTestableWidget(
        widget: MainPage(),
      ),
    );

    await tester.pump();

    expect(find.byType(ConnectionAppBar), findsNothing);
    expect(find.byType(PageView), findsOneWidget);
    expect(find.byType(AirplaneModeFloating), findsNothing);
  });
}