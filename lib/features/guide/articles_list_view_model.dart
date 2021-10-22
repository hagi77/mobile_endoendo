import 'package:get_it/get_it.dart';
import 'package:mobile_endoendo/core/base_view_model.dart';
import 'package:mobile_endoendo/features/models/article_ui_model.dart';
import 'package:mobile_endoendo/features/models/articles_category_model.dart';
import 'package:mobile_endoendo/repositories/articles_repository.dart';
import 'package:mobile_endoendo/repositories/data/article.dart';

class ArticlesListViewModel extends BaseViewModel {
  final _articlesRepo = GetIt.I<ArticlesRepository>();

  late ArticlesCategory? _category;

  get title => _category?.name ?? '';

  bool get hasCategory => _category != null;

  Future<List<ArticleUiModel>> getArticles() async {
    List<ArticleUiModel> models = List.empty();
    List<Article> articles = List.empty();

    try {
      if (hasCategory) {
        articles = await _articlesRepo.getArticles(_category!.tag);
      } else {
        articles = await _articlesRepo.getAllArticles();
      }

      models = articles.map((item) => ArticleUiModel.from(item)).toList();
    } catch (e) {
      rethrow;
    }
    return models;
  }

  void setCategory(ArticlesCategory? category) {
    _category = category;
  }
}
