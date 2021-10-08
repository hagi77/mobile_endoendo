class DashboardViewModel {
  var counter = 0;
  void Function()? _listener;

  void increaseCounter() {
    counter++;
    _listener?.call();
  }

  void addListener(void Function() update) {
    _listener = update;
  }

  void removeListener() {
    _listener = null;
  }
}
