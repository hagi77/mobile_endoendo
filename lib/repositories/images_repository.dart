import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

abstract class ImagesRepository {
  Future<String> getImageUrl(String filename);
}

class ImagesRepositoryImpl implements ImagesRepository {
  final _filesApi = firebase_storage.FirebaseStorage.instance;
  late final _imageFilesRef = _filesApi.ref().child('images');

  @override
  Future<String> getImageUrl(String filename) async =>
      _imageFilesRef.child(filename).getDownloadURL();
}
