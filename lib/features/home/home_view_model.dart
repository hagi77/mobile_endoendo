import 'package:mobile_endoendo/core/base_view_model.dart';

class HomeViewModel extends BaseViewModel {
  var currentBottomNavigIndex = 0;

  onBottomNavigation(int index) {
    currentBottomNavigIndex = index;
    updateView();
  }
}
