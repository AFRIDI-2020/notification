import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:notification/main.dart';
import 'package:notification/wifi_list.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  /*group('end-to-end test', () {
    testWidgets('tap on the floating action button, verify counter', (
        tester,
        ) async {
      // Load app widget.
      await tester.pumpWidget(const MyApp());

      // Verify the counter starts at 0.
      expect(find.text('0'), findsOneWidget);

      // Finds the floating action button to tap on.
      final fab = find.byKey(const ValueKey('increment'));

      // Emulate a tap on the floating action button.
      await tester.tap(fab);

      // Trigger a frame.
      await tester.pumpAndSettle();

      // Verify the counter increments by 1.
      expect(find.text('1'), findsOneWidget);
    });
  });*/

  group("testing wifi", (){
    
    testWidgets("tap on wifi button and navigate to wifi list screen", (tester) async {
      await tester.pumpWidget(const MyApp());

      final wifiButton = find.byKey(ValueKey("wifi button"));
      await tester.tap(wifiButton);
      await tester.pumpAndSettle();
      expect(find.byType(WifiList), findsOneWidget);
    });
    
  });
}