import 'data/article_thumbnail.dart';

abstract class ArticlesRepository {
  Future<List<ArticleThumbnail>> getNews();
}

class ArticlesRepoMock implements ArticlesRepository {
  @override
  Future<List<ArticleThumbnail>> getNews() async {
    await Future.delayed(const Duration(seconds: 2));
    return List.of({
      const ArticleThumbnail('url', 'title', 'subtitle'),
      const ArticleThumbnail('url2', 'title2', 'subtitle2')
    });
  }
}
