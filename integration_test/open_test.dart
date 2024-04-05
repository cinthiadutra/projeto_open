import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:projeto_open/main.dart' as app;
import 'package:projeto_open/view/create_post_page.dart';
import 'package:projeto_open/view/post_detail_page.dart';
import 'package:projeto_open/view/splash_page.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('fluxo do app', () {
    app.main();
    testWidgets('fluxo de ir ate os detalhes', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      await tester.pumpWidget(
        const MaterialApp(home: SplashPage()),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key("button_add_key")));
      await tester.pumpAndSettle();

      await Future.delayed(const Duration(seconds: 7));
      await tester.pumpWidget(
        const MaterialApp(home: CreatePostPage()),
      );
      await Future.delayed(const Duration(seconds: 7));

      expect(find.text('comentários'), findsOne);
    });

    testWidgets(
      'fluxo de criar pos',
      (tester) async {
        app.main();
        await tester.pumpAndSettle();

        await tester.pumpWidget(
          const MaterialApp(home: SplashPage()),
        );
        await tester.pumpAndSettle();

        await tester.tap(find.byKey(const Key("button_add_key")));
        await tester.pumpAndSettle();

        await Future.delayed(const Duration(seconds: 7));
        await tester.pumpWidget(
          const MaterialApp(
              home: PostDetailPage(
            index: 1,
          )),
        );
        await Future.delayed(const Duration(seconds: 7));

        await tester.tap(find.byKey(const Key('input_title_key')));
        await tester.pumpAndSettle();

        await Future.delayed(const Duration(seconds: 6));
        await tester.pumpAndSettle();

        await tester.enterText(find.byKey(const Key('input_title_key')), '');
        await tester.pumpAndSettle();

        await tester.tap(find.byKey(const Key('input_body_key')));
        await tester.pumpAndSettle();

        await Future.delayed(const Duration(seconds: 6));
        await tester.pumpAndSettle();

        await tester.enterText(find.byKey(const Key('input_body_key')), '');
        await tester.pumpAndSettle();

        await Future.delayed(const Duration(seconds: 6));

        await tester.tap(find.byKey(const Key("button_criar_key")));

        expect(find.byWidget(AsukaSnackbar.success('Post Criado com sucesso')),
            findsOneWidget);
      },
    );
  });
}
