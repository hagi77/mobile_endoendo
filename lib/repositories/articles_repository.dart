import 'package:cloud_firestore/cloud_firestore.dart';

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

class ArticlesRepositoryImpl implements ArticlesRepository {
  late final CollectionReference _articlesApi =
      FirebaseFirestore.instance.collection('articles');

  @override
  Future<List<ArticleThumbnail>> getNews() async {
    final articles = await _articlesApi.get();
    return articles.docs
        .map((article) =>
            ArticleThumbnail("", article.get("title"), article.get("lead")))
        .toList();
  }
}
