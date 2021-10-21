import 'dart:convert';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'data/article.dart';

abstract class ArticlesRepository {
  Future<List<Article>> getNews();

  Future<List<Article>> getArticles(String tag);
}

class ArticlesRepositoryImpl implements ArticlesRepository {
  final _newsThumbsApi = FirebaseFirestore.instance.collection('news').withConverter<Article>(
      fromFirestore: (snapshot, _) => Article.fromJSON(snapshot.id, snapshot.data()!),
      toFirestore: (article, _) => article.toJson());

  final _articlesApi = FirebaseFirestore.instance.collection('articles').withConverter<Article>(
      fromFirestore: (snapshot, _) => Article.fromJSON(snapshot.id, snapshot.data()!),
      toFirestore: (article, _) => article.toJson());

  late final _newsFilesRef = firebase_storage.FirebaseStorage.instance.ref().child('news');
  late final _articlesFilesRef = firebase_storage.FirebaseStorage.instance.ref().child('articles');

  @override
  Future<List<Article>> getArticles(String tag) async {
    final articles =
        (await _articlesApi.where('tags', arrayContains: tag).get()).docs.map((doc) => doc.data());
    return _attachTextToArticles(articles, _articlesFilesRef);
  }

  @override
  Future<List<Article>> getNews() async {
    final articles = (await _newsThumbsApi.get()).docs.map((doc) => doc.data());
    return _attachTextToArticles(articles, _newsFilesRef);
  }

  Future<List<Article>> _attachTextToArticles(
      Iterable<Article> documents, firebase_storage.Reference api) async {
    Map<Article, Future<Uint8List?>> futures = {};

    for (var document in documents) {
      futures.putIfAbsent(document, () => api.child(document.textFile).getData());
    }

    return _fillArticles(futures).toList();
  }

  Stream<Article> _fillArticles(Map<Article, Future<Uint8List?>> map) async* {
    for (var item in map.entries) {
      var result = await item.value;
      var article = item.key;
      if (result != null) {
        article.text = utf8.decode(result.toList(), allowMalformed: true);
      }
      yield article;
    }
  }
}
