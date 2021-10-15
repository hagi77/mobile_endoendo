import 'dart:convert';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'data/article.dart';

abstract class ArticlesRepository {
  Future<List<Article>> getNews();
}

class ArticlesRepositoryImpl implements ArticlesRepository {
  final _newsThumbsApi = FirebaseFirestore.instance.collection('news').withConverter<Article>(
      fromFirestore: (snapshot, _) => Article.fromJSON(snapshot.id, snapshot.data()!),
      toFirestore: (article, _) => article.toJson());

  final _filesApi = firebase_storage.FirebaseStorage.instance;
  late final _newsFilesRef = _filesApi.ref().child('news');

  @override
  Future<List<Article>> getNews() async {
    final articles = (await _newsThumbsApi.get()).docs.map((doc) => doc.data());

    Map<Article, Future<Uint8List?>> futures = {};

    for (var article in articles) {
      futures.putIfAbsent(article, () => _getNewsArticle(article.textFile));
    }

    return _getStream(futures).toList();
  }

  Future<Uint8List?> _getNewsArticle(String filename) async =>
      _newsFilesRef.child(filename).getData();

  Stream<Article> _getStream(Map<Article, Future<Uint8List?>> map) async* {
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
