import 'package:get_it/get_it.dart';
import 'package:mobile_endoendo/core/base_view_model.dart';
import 'package:mobile_endoendo/features/dashboard/dashboard_view_model.dart';
import 'package:mobile_endoendo/repositories/articles_repository.dart';

class ArticlesListViewModel extends BaseViewModel {
  final _articlesRepo = GetIt.I<ArticlesRepository>();

  Future<List<ArticleUiModel>> getArticles() async {
    List<ArticleUiModel> models = List.empty();
    try {
      var articles = await _articlesRepo.getNews();
      models = articles.map((item) => ArticleUiModel.from(item)).toList();
    } catch (e) {
      rethrow;
    }
    return models;
  }
}
