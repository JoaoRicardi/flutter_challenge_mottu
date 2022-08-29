import 'package:flutter/cupertino.dart';
import 'package:flutter_challenge/src/presentation/modules/welcome/welcome_page.dart';
import 'package:flutter_challenge/src/presentation/widgtes/button.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../utils/utils.dart';

main() {
  setUpAll(() {
    TestUtils.setUpAllTests();
  });

  testWidgets('Welcome page test', (WidgetTester tester) async {
    PageController pageController = PageController();

    await tester.pumpWidget(
      TestUtils.buildTestableWidget(
        widget: WelcomePage(pageController: pageController),
      ),
    );

    await tester.pump();

    expect(find.byKey(const Key('welcome_image')), findsOneWidget);
    expect(find.byType(MottuButton), findsOneWidget);
    expect(
        find.text(
            'Pensamos em novas formas de melhorar o nosso app, para que você trabalhe masi tranquilo.'),
        findsOneWidget);
  });
}
