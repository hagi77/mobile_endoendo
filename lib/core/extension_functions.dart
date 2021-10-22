import 'package:flutter/cupertino.dart';

extension AsyncLoadingState on AsyncSnapshot {
  bool get loaded => connectionState == ConnectionState.done && hasData;
}

extension ParseStringList on List<dynamic>? {
  List<String> parseStringsList() =>
      this != null ? this!.map((element) => element as String).toList() : List.empty();
}
