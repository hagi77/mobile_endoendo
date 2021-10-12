import 'package:mobile_endoendo/core/base_view_model.dart';

class DashboardViewModel extends BaseViewModel {
  var counter = 0;

  void increaseCounter() {
    counter++;
    callback?.call();
  }
}
