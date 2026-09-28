import 'package:flutter_test/flutter_test.dart';
import 'package:app7/main.dart';

void main() {
  testWidgets('PixelDash renders app correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const PixelDashApp());
    expect(find.byType(PixelDashApp), findsOneWidget);
  });
}
