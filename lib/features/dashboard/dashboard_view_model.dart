import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_endoendo/core/base_view_model.dart';
import 'package:mobile_endoendo/features/models/article_ui_model.dart';
import 'package:mobile_endoendo/features/models/articles_category_model.dart';
import 'package:mobile_endoendo/repositories/articles_repository.dart';

class DashboardViewModel extends BaseViewModel {
  var articlesRepo = GetIt.I<ArticlesRepository>();

  Future<List<ArticleUiModel>> getNews() async {
    List<ArticleUiModel> models = List.empty();
    try {
      var articles = await articlesRepo.getNews();
      models = articles.map((item) => ArticleUiModel.from(item)).toList();
    } catch (e) {
      rethrow;
    }
    return models;
  }

  List<ArticlesCategory> getGuideTopics(BuildContext context) => [
        ArticlesCategory(AppLocalizations.of(context)?.dashboardGuideTopicSymptoms ?? ''),
        ArticlesCategory(AppLocalizations.of(context)?.dashboardGuideTopicDiet ?? ''),
        ArticlesCategory(AppLocalizations.of(context)?.dashboardGuideTopicFertility ?? ''),
        ArticlesCategory(AppLocalizations.of(context)?.dashboardGuideTopicTreatment ?? ''),
        ArticlesCategory(AppLocalizations.of(context)?.dashboardGuideTopicClinics ?? ''),
        ArticlesCategory(AppLocalizations.of(context)?.dashboardGuideTopicSupport ?? ''),
        ArticlesCategory(AppLocalizations.of(context)?.dashboardGuideTopicBooks ?? ''),
        ArticlesCategory(AppLocalizations.of(context)?.dashboardGuideTopicFisio ?? ''),
      ];
}
