import 'package:flutter/cupertino.dart';

extension AsyncLoadingState on AsyncSnapshot {
  bool get loaded => connectionState == ConnectionState.done && hasData;
}

extension ParseStringList on List<dynamic> {
  List<String> parseStringsList() => map((element) => element as String).toList();
}
