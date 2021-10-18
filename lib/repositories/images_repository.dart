import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

abstract class ImagesRepository {
  Future<Uint8List?> getImage(String filename);
}

class ImagesRepositoryImpl implements ImagesRepository {
  final _filesApi = firebase_storage.FirebaseStorage.instance;
  late final _imageFilesRef = _filesApi.ref().child('images');

  @override
  Future<Uint8List?> getImage(String filename) async => _imageFilesRef.child(filename).getData();
}
