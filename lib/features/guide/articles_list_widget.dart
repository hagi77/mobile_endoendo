import 'package:flutter/cupertino.dart';
import 'package:mobile_endoendo/core/base_widget_state.dart';
import 'package:mobile_endoendo/features/guide/articles_list_view_model.dart';

class ArticlesListWidget extends StatefulWidget {
  static const routeName = '/articles_list';

  const ArticlesListWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ArticlesListWidgetState();
}

class _ArticlesListWidgetState extends BaseWidgetState<ArticlesListWidget, ArticlesListViewModel> {
  @override
  Widget build(BuildContext context) {
    return Text('test');
  }
}
