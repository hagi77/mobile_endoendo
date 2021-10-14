// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_endoendo/features/dashboard/dashboard_view_model.dart';
import 'package:mobile_endoendo/features/dashboard/dashboard_widget.dart';
import 'package:mobile_endoendo/repositories/articles_repository.dart';
import 'package:mobile_endoendo/repositories/data/article.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'dashboard_widget_test.mocks.dart';

@GenerateMocks([ArticlesRepository])
void main() {
  final mockRepo = MockArticlesRepository();

  const Widget dashboardWidget = MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: DashboardWidget(),
      ));

  Future<void> initDI() async {
    await GetIt.I.reset();

    GetIt.I.registerSingletonAsync<ArticlesRepository>(() async => mockRepo);
    GetIt.I.registerSingletonWithDependencies<DashboardViewModel>(
        () => DashboardViewModel(),
        dependsOn: [ArticlesRepository]);
  }

  testWidgets('Should show news section when news articles are available',
      (WidgetTester tester) async {
    when(mockRepo.getNews())
        .thenAnswer((realInvocation) => Future.value(List.of({
          const Article('1', 'url', 'mock title 1', 'mock subtitle 1', 'text'),
          const Article('2', 'url2', 'mock title 2', 'mock subtitle 2', 'text2')
        })));

    await initDI();

    await tester.pumpWidget(dashboardWidget);
    await tester.pump();

    expect(find.text('Nowości'), findsOneWidget);
    expect(find.text('mock title 1'), findsOneWidget);
    expect(find.text('mock title 2'), findsOneWidget);
    expect(find.text('mock subtitle 1'), findsOneWidget);
    expect(find.text('mock subtitle 2'), findsOneWidget);
  });

  testWidgets(
      'Should not show news section when no news articles are available',
      (WidgetTester tester) async {
    when(mockRepo.getNews())
        .thenAnswer((realInvocation) => Future.value(List.empty()));

    await initDI();

    await tester.pumpWidget(dashboardWidget);
    await tester.pump();

    expect(find.text('Nowości'), findsNothing);
    expect(find.text('mock title 1'), findsNothing);
    expect(find.text('mock title 2'), findsNothing);
    expect(find.text('mock subtitle 1'), findsNothing);
    expect(find.text('mock subtitle 2'), findsNothing);
  });
}
