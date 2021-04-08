
import 'package:fizzbuzz/src/features/fizzbuzz/fizzbuzz.screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supercharged/supercharged.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../helpers/pump_app.dart';

void main() {
  group('FizzBuzzPage', () {
    Key itemAtIndexKey(int index) => Key('No: $index');
    group('The FizzBuzzPage widget is created ', () {
      testWidgets('FizzBuzzPage displays the ListView and FizzBuzzPage widgets', (tester) async {
        await tester.pumpApp(ProviderScope(child: FizzBuzzPage()));

        expect(find.byType(ListView), findsOneWidget);
        expect(find.byType(FizzBuzzPage), findsOneWidget);


      });

      testWidgets('FizzBuzzPage displays the first 10 results', (tester) async {
        await tester.pumpApp(ProviderScope(child: FizzBuzzPage()));

        for (var i in 1.rangeTo(10))
          expect(find.byKey(itemAtIndexKey(i)), findsOneWidget);
      });

    });
  });
}
