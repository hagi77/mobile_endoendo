import 'package:get_it/get_it.dart';
import 'package:mobile_endoendo/core/base_view_model.dart';
import 'package:mobile_endoendo/repositories/articles_repository.dart';
import 'package:mobile_endoendo/repositories/data/article.dart';

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
}

class ArticleUiModel {
  final String title;
  final String subtitle;
  final String thumbUrl;

  ArticleUiModel.from(Article data)
      : title = data.title,
        subtitle = data.lead,
        thumbUrl = data.thumbUrl;
}
