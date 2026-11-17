
import 'package:flutter_test/flutter_test.dart';
import 'package:fastlocation/main.dart';

void main() {
  testWidgets('FastLocation inicia corretamente', (WidgetTester tester) async {
    await tester.pumpWidget(const FastLocationApp());

    expect(find.text('FastLocation'), findsOneWidget);

    // Aguarda os 3 segundos da tela inicial.
    await tester.pump(const Duration(seconds: 3));

    // Aguarda a construção da tela seguinte.
    await tester.pumpAndSettle();

    expect(find.text('Encontre um endereço'), findsOneWidget);
  });
}
