import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_endoendo/core/base_view_model.dart';

abstract class BaseWidgetState<W extends StatefulWidget,
    V extends BaseViewModel> extends State<W> {
  final V viewModel = GetIt.I<V>();

  void update() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    viewModel.addListener(update);
  }

  @override
  void dispose() {
    viewModel.removeListener();
    super.dispose();
  }
}
