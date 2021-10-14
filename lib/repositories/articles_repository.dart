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
      const Article(id: '1', thumbUrl: 'url', title: 'title', lead: 'subtitle', text: 'text'),
      const Article(id: '2', thumbUrl: 'url2', title: 'title2', lead: 'subtitle2', text: 'text2'),
    });
  }
}

class ArticlesRepositoryImpl implements ArticlesRepository {
  final _articlesApi = FirebaseFirestore.instance.collection('articles');

  final _newsApi = FirebaseFirestore.instance.collection('news').withConverter<Article>(
      fromFirestore: (snapshot, _) => Article.fromJSON(snapshot.id, snapshot.data()!),
      toFirestore: (article, _) => article.toJson());

  @override
  Future<List<Article>> getNews() async {
    final news = await _newsApi.get();
    return news.docs.map((doc) => doc.data()).toList();
  }
}
