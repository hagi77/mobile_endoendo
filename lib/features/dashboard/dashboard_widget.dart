import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_endoendo/core/base_widget_state.dart';
import 'package:mobile_endoendo/features/dashboard/dashboard_view_model.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<DashboardWidget> createState() => _DashboardState();
}

class _DashboardState
    extends BaseWidgetState<DashboardWidget, DashboardViewModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${viewModel.counter}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          viewModel.increaseCounter();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
