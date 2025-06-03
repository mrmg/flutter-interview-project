// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interview/screens/market_list_screen.dart';

void main() {
  testWidgets('Market list screen smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          title: 'Markets',
          home: MarketListScreen(title: 'Markets'),
        ),
      ),
    );

    // Verify that the app title is displayed
    expect(find.text('Markets'), findsOneWidget);
  });
}
