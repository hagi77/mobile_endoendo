import 'package:flutter/cupertino.dart';

extension AsyncLoadingState on AsyncSnapshot {
  bool get loaded => connectionState == ConnectionState.done && hasData;
}
