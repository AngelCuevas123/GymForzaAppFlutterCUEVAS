import 'package:flutter_test/flutter_test.dart';
import 'package:gymforza_app_flutter_cuevas/main.dart';

void main() {
  testWidgets('Gym Forza app inicia correctamente', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const GymForzaApp());

    expect(find.text('GYM FORZA'), findsOneWidget);
  });
}
