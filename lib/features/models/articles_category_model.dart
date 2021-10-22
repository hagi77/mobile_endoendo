import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ArticlesCategory {
  final String name;
  final String tag;

  const ArticlesCategory(this.name, this.tag);
}

List<ArticlesCategory> generateCategories(BuildContext context) => [
      ArticlesCategory(AppLocalizations.of(context)?.dashboardGuideTopicSymptoms ?? '', 'diagnoza'),
      ArticlesCategory(AppLocalizations.of(context)?.dashboardGuideTopicDiet ?? '', 'dieta'),
      ArticlesCategory(
          AppLocalizations.of(context)?.dashboardGuideTopicFertility ?? '', 'płodność'),
      ArticlesCategory(
          AppLocalizations.of(context)?.dashboardGuideTopicTreatment ?? '', 'leczenie'),
      ArticlesCategory(
          AppLocalizations.of(context)?.dashboardGuideTopicClinics ?? '', 'kliniki i lekarze'),
      ArticlesCategory(AppLocalizations.of(context)?.dashboardGuideTopicSupport ?? '', 'wsparcie'),
      ArticlesCategory(AppLocalizations.of(context)?.dashboardGuideTopicBooks ?? '', 'książki'),
      ArticlesCategory(
          AppLocalizations.of(context)?.dashboardGuideTopicFisio ?? '', 'fizjoterapia'),
    ];
