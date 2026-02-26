import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/widgets.dart';
import 'package:shepherd_tag/shepherd_tag.dart';

void main() {
  group('ShepherdTag annotation', () {
    test('creates with required id', () {
      const tag = ShepherdTag(id: 'US-001');
      expect(tag.id, 'US-001');
      expect(tag.description, isNull);
    });

    test('creates with optional description', () {
      const tag = ShepherdTag(
        id: 'US-002',
        description: 'Registration flow',
      );
      expect(tag.id, 'US-002');
      expect(tag.description, 'Registration flow');
    });
  });

  group('ShepherdPageTag widget', () {
    testWidgets('renders child unchanged', (tester) async {
      await tester.pumpWidget(
        const Directionality(
          textDirection: TextDirection.ltr,
          child: ShepherdPageTag(
            id: 'US-001',
            child: Text('Hello Shepherd'),
          ),
        ),
      );
      expect(find.text('Hello Shepherd'), findsOneWidget);
    });

    testWidgets('exposes semantics label with shepherd prefix', (tester) async {
      final handle = tester.ensureSemantics();

      await tester.pumpWidget(
        const Directionality(
          textDirection: TextDirection.ltr,
          child: ShepherdPageTag(
            id: 'US-001',
            child: SizedBox(),
          ),
        ),
      );

      final semantics = tester.getSemantics(find.byType(ShepherdPageTag));
      expect(semantics.label, contains('shepherd:US-001'));

      handle.dispose();
    });

    testWidgets('isReady defaults to true', (tester) async {
      await tester.pumpWidget(
        const Directionality(
          textDirection: TextDirection.ltr,
          child: ShepherdPageTag(
            id: 'US-003',
            child: SizedBox(),
          ),
        ),
      );
      expect(find.byType(ShepherdPageTag), findsOneWidget);
    });

    testWidgets('accepts isReady false without errors', (tester) async {
      await tester.pumpWidget(
        const Directionality(
          textDirection: TextDirection.ltr,
          child: ShepherdPageTag(
            id: 'US-004',
            isReady: false,
            child: SizedBox(),
          ),
        ),
      );
      expect(find.byType(ShepherdPageTag), findsOneWidget);
    });
  });
}
