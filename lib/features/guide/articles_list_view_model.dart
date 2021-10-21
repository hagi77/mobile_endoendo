import 'package:get_it/get_it.dart';
import 'package:mobile_endoendo/core/base_view_model.dart';
import 'package:mobile_endoendo/features/models/article_ui_model.dart';
import 'package:mobile_endoendo/features/models/articles_category_model.dart';
import 'package:mobile_endoendo/repositories/articles_repository.dart';

class ArticlesListViewModel extends BaseViewModel {
  final _articlesRepo = GetIt.I<ArticlesRepository>();

  late ArticlesCategory _category;

  get title => _category.name;

  Future<List<ArticleUiModel>> getArticles() async {
    List<ArticleUiModel> models = List.empty();
    try {
      var articles = await _articlesRepo.getArticles(_category.tag);
      models = articles.map((item) => ArticleUiModel.from(item)).toList();
    } catch (e) {
      rethrow;
    }
    return models;
  }

  void setCategory(ArticlesCategory category) {
    _category = category;
  }
}
