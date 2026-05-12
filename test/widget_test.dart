import 'package:flutter_test/flutter_test.dart';
import 'package:sarap_finder/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const SarapFinderApp());
  });
}
