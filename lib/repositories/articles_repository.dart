import 'package:cloud_firestore/cloud_firestore.dart';

import 'data/article.dart';

abstract class ArticlesRepository {
  Future<List<Article>> getNews();
}

class ArticlesRepoMock implements ArticlesRepository {
  @override
  Future<List<Article>> getNews() async {
    await Future.delayed(const Duration(seconds: 2));
    return List.of({
      const Article('1', 'url', 'title', 'subtitle', 'text'),
      const Article('2', 'url2', 'title2', 'subtitle2', 'text2')
    });
  }
}

class ArticlesRepositoryImpl implements ArticlesRepository {
  final _articlesApi = FirebaseFirestore.instance.collection('articles');
  final _newsApi = FirebaseFirestore.instance.collection('news');

  @override
  Future<List<Article>> getNews() async {
    final news = await _newsApi.get();
    return news.docs
        .map((article) => Article(article.id, "", article.get("title"),
            article.get("lead"), article.get("text")))
        .toList();
  }
}
